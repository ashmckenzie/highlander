class StatsController < ApplicationController

  def index
    @stats = Rails.cache.fetch('stats', expires_in: 30.minutes) do
      Hashie::Mash.new({
        all_time:    Queries::Stats.new.query,
        past_month:  Queries::Stats.new.query(Time.zone.now - 1.month)
      })
    end
  end
end
