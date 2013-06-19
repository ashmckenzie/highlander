module Queries

  class RunningLeaderboard

    def initialize(users_relation: User.leaderboarder, running_period_start: 1.weeks.ago)
      @users_relation       = users_relation
      @running_period_start = running_period_start
    end

    def each_with_index(&block)
      query.each(&block)
    end

    def query
      users_relation
        .select('
          users.*,
          coalesce(sum(events.value), 0) as running_score,
          (select count(id) from achievements a where a.user_id = users.id) as total_badges,
          twitter_services.username as twitter_username
        ')
        .joins("left outer join events on events.user_id = users.id")
        .joins("join user_services on user_services.user_id = users.id")
        .joins("left outer join twitter_services on twitter_services.id = user_services.service_id")
        .group('users.id, twitter_username')
        .order('running_score DESC, total_badges DESC')
    end

    private

    attr_reader :users_relation, :running_period_start

  end

end
