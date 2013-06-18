class BadgesController < ApplicationController

  def index
    @badges_groped_by_metric = Queries::BadgesIncludingAchievedGroupedByMetric.new.query
  end

  def show
    @badge = Queries::BadgesIncludingAchievedGroupedByMetric.new(relation: Badge.where_id_or_slug(params[:id])).query
  end
end
