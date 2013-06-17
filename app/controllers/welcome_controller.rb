class WelcomeController < ApplicationController

  def index
    @users = Rails.cache.fetch('leaderboard', expires_in: 5.minutes) do
      Queries::RunningLeaderboard.new.query.decorate
    end
  end
end
