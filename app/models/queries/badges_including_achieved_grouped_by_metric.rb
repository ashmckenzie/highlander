module Queries

  class BadgesIncludingAchievedGroupedByMetric

    def initialize(relation: Badge.enabled)
      @relation = relation
    end

    def each(&block)
      query.each(&block)
    end

    def query
      relation
        .select('distinct(badges.*)')
        .joins(:achievements, :users)
        .order('badges.position ASC')
        .group_by { |x| x.related_metric }
    end

    private

    attr_reader :relation

  end
end
