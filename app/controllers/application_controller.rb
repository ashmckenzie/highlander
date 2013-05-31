class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Workaround for Strong Params & CanCan bug - https://github.com/ryanb/cancan/issues/835
  #
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if signed_in?
  end

  def signed_in?
    session[:user_id].present?
  end

  helper_method :current_user
  helper_method :signed_in?

end
