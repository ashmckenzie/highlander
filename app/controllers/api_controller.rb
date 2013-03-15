class ApiController < ApplicationController

  class InvalidUserToken < RuntimeError ; end

  respond_to :json

  rescue_from InvalidUserToken do
    render :text => "User is not authorised", :status => :unauthorized
  end

  before_filter :set_default_format, :set_current_user
  skip_before_filter :verify_authenticity_token

  def current_user
    @current_user
  end

  protected

  def set_current_user
    @current_user ||= User.point_earner.with_email(params[:email])
    raise InvalidUserToken if @current_user.nil?
  end

  private

  def set_default_format
    request.format = 'json'
  end

  def new_event_for_user metric
    current_user.events << Event.create(user: current_user, metric: metric)
  end
end
