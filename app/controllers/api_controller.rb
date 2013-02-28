class ApiController < ApplicationController

  class InvalidAppToken < RuntimeError ; end
  class InvalidUserToken < RuntimeError ; end

  USER_ID_HEADER = 'HTTP_X_USER_ID'
  APP_ID_HEADER = 'HTTP_X_APP_ID'

  respond_to :json

  rescue_from InvalidUserToken, InvalidAppToken do
    render :text => "Could not authenticate user or app", :status => :unauthorized
  end

  # rescue_from ::CanCan::AccessDenied do
  #   render :text => "You do not have access to this service", :status => :forbidden
  # end

  before_filter :set_default_format
  skip_before_filter :verify_authenticity_token

  def current_user
    begin
      @current_user ||= User.find(user_id)
    rescue
      raise InvalidAppToken
    end
  end

  def current_app
    begin
      @current_app ||= current_user.apps.find(app_id)
    rescue
      raise InvalidUserToken
    end
  end

  def current_ability
    @current_ability ||= Ability.new current_app
  end

  private

  def user_id
    if params[:user_id]
      params[:user_id]
    elsif request.headers[USER_ID_HEADER]
      request.headers[USER_ID_HEADER]
    else
      authenticate_with_http_basic do |user, pass|
        user
      end
    end
  end

  def app_id
    if params[:app_id]
      params[:app_id]
    elsif request.headers[APP_ID_HEADER]
      request.headers[APP_ID_HEADER]
    else
      authenticate_with_http_basic do |user, pass|
        pass
      end
    end
  end

  def set_default_format
    request.format = 'json'
  end
end
