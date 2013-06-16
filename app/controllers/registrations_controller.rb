class RegistrationsController < ApplicationController

  def index
    @registration = Registration.new unless registered?
  end

  def create
    redirect_to :index unless registered?

    @registration = Registration.new(registration_params)

    respond_to do |format|
      if @registration.save
        cookies['registration'] = registration_params[:email]
        format.html { redirect_to root_register_path, notice: 'Registration was successfully created.' }
      else
        format.html { render action: 'index' }
      end
    end
  end

  private

  def registered?
    @registered ||= !cookies['registration'].blank?
  end

  def registration_params
    params.require(:registration).permit(:email)
  end

end
