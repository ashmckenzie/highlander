class RegistrationsController < ApplicationController

  def index
    @registration = Registration.new unless registered?
  end

  def create
    if registered?
      redirect_to action: :index
    else
      @registration = Registration.new(registration_params)

      respond_to do |format|
        if @registration.save
          cookies['registration'] = registration_params[:email]
          format.html { redirect_to root_register_path, notice: 'Thanks for your expression of interest!' }
        else
          format.html { render action: 'index' }
        end
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
