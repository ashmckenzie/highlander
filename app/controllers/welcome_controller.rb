class WelcomeController < ApplicationController

  def index
    @users = Queries::RunningLeaderboard.new.query.decorate
  end

  def register
  end
end
