class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    deets = request.env["omniauth.auth"]['info']
    user = User.with_email(deets['email']) || User.create(name: deets['name'], preferred_email: deets['email'], emails: [ deets['email'] ])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

end