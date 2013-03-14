class Api::EventsController < ApiController

  def create
    if new_event_for_user(metric)
      code = :ok
    else
      code = :not_found
    end

    respond_to do |format|
      format.json { head code }
    end
  end

  private

  def metric
    Metric.where(name: params['metric']).first
  end
end
