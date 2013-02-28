class Api::EventsController < ApiController

  def create
    current_user.events << Event.create(user: current_user, metric: Metric.where(name: params['metric']).first)

    respond_to do |format|
      format.html
      format.json { head :ok }
    end
  end
end
