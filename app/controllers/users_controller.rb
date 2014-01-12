class UsersController < ApplicationController
  authorize_resource only: [:edit, :update]

  before_filter :load_user,           only: [ :edit, :update ]
  before_filter :load_decorated_user, only: [ :show ]

  def index
    @users = User.all
  end

  def show
    @stats = Rails.cache.fetch("user-stats-#{user.id}", expires_in: 5.minutes) do
      Queries::Stats.new(user: user.user, achievements: false).query
    end
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end

  private

    def load_decorated_user
      @user = user.decorate
    end

    def load_user
      @user = user
    end

    def user
      @user ||= User.find(params[:id]) || not_found
    end

    def user_params
      params[:user].permit(:name, :email, :bio)
    end

end
