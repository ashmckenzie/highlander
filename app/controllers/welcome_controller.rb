class WelcomeController < ApplicationController

  def index
    @users = User.by_total_score
  end
end
