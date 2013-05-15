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
        .select('users.*, coalesce(sum(events.value), 0) as running_score, (select count(id) from achievements a where a.user_id = users.id) as total_badges')
        .joins("left outer join events on events.user_id = users.id and events.created_at > '#{running_period_start.to_s(:db)}'")
        .group('users.id')
        .order('running_score DESC, total_badges DESC')
    end

    private

    attr_reader :users_relation, :running_period_start

  end

end
