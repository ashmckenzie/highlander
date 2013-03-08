class Api::EventsController < ApiController

  def create
    if metric = Metric.where(name: params['metric']).first
      current_user.events << Event.create(user: current_user, metric: metric)
      code = :ok
    else
      code = :not_found
    end

    respond_to do |format|
      format.json { head code }
    end
  end
end
