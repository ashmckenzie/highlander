class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    user = User.with_email(email) || User.create(name: name, hooroo_email: email, emails: [ email ])

    # temporarily correct user emails so that hooroo_email is their Hooroo one
    unless user.hooroo_email.ends_with?('@hooroo.com')
      user.emails = (user.emails + [ user.hooroo_email ]).flatten.uniq
      user.hooroo_email = email
      user.save!
    end

    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  private

  def name
    details['name']
  end

  def email
    details['email']
  end

  def details
    @details ||= request.env["omniauth.auth"]['info']
  end

end