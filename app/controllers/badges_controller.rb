class BadgesController < ApplicationController

  def index
    @badges_groped_by_metric = Queries::BadgesIncludingAchievedGroupedByMetric.new.query
  end

  def show
  end
end
