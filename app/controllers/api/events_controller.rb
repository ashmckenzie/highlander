class Api::EventsController < ApiController

  before_filter :adapt_payload

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

  def adapt_payload

  end

  def valid_metrics
    Metric::NAMES & interested_in_metrics
  end

  def interested_in_metrics
    %w{
        jenkins_green_job
        ming_pong_loss
        ming_pong_victory
        gift
        express_yaself
      }
  end

  def metric_name
    params['metric']
  end

  def metric
    Metric.where(name: metric_name).first
  end

end
