class StatsController < ApplicationController

  def index
    @stats = Rails.cache.fetch('stats', expires_in: 30.minutes) do
      Queries::Stats.new.query
    end
  end
end
