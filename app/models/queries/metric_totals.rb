module Queries

  class MetricTotals

    def initialize(relation: Metric.scoped, user: user)
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
        .select('metrics.id, metrics.description, coalesce(sum(events.value), 0) as event_total')
        .joins('left join events on events.metric_id = metrics.id')
        .where('events.user_id = ?', user.id)
        .group('metrics.id, metrics.description')
    end

  end

end
