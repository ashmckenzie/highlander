class Api::EventsController < ApiController

  def create

    # User.where(email: params['email']).events << Event.create()

    respond_to do |format|
      format.html
      format.json { head :ok }
    end
  end
end
