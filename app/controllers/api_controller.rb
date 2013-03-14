class ApiController < ApplicationController

  class InvalidUserToken < RuntimeError ; end

  respond_to :json

  rescue_from InvalidUserToken do
    render :text => "Could not authenticate user '#{params[:email]}'", :status => :unauthorized
  end

  before_filter :set_default_format
  skip_before_filter :verify_authenticity_token

  def current_user
    begin
      @current_user ||= User.where("'params[:email]' = ANY (emails)").first
    rescue
      raise InvalidUserToken
    end
  end

  private

  def set_default_format
    request.format = 'json'
  end
end
