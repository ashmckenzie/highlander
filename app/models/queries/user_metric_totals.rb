module Queries

  class UserMetricTotals

    def initialize(relation: Metric.all, user: user)
      @relation = relation
      @user     = user
    end

    def each(&block)
      query.each(&block)
    end

    private

    attr_reader :relation, :user

    def query
      relation
        .select('metrics.id, metrics.description, sum(1) as event_total_count, coalesce(sum(events.value), 0) as event_total_value')
        .joins('left outer join events on events.metric_id = metrics.id')
        .where('events.user_id = ?', user.id)
        .group('metrics.id, metrics.description')
    end

  end

end
