class ApiController < ApplicationController

  class InvalidUserToken < RuntimeError ; end

  respond_to :json

  rescue_from InvalidUserToken do
    render :text => "Could not authenticate user", :status => :unauthorized
  end

  before_filter :set_default_format, :set_current_user
  skip_before_filter :verify_authenticity_token

  def current_user
    @current_user
  end

  protected

  def set_current_user
    begin
      @current_user ||= User.with_email(params[:email])
    rescue
      raise InvalidUserToken
    end
  end

  private

  def set_default_format
    request.format = 'json'
  end

  def new_event_for_user metric
    current_user.events << Event.create(user: current_user, metric: metric)
  end
end
