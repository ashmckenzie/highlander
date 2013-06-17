class WelcomeController < ApplicationController

  def index
    Rails.cache.fetch('leaderboard', expires_in: 5.minutes) do
      @users = Queries::RunningLeaderboard.new.query.decorate
    end
  end
end
