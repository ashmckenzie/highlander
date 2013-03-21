class Api::Adapters::TwitterController < Api::AdapterController

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

  protected

  def set_current_user
    @current_user ||= User.point_earner.find_by_twitter_username!(params[:twitter_username])
  rescue
    raise InvalidUserToken
  end

  private

  def valid_metrics
    %w{ twitter_mention }
  end

  def metric_name
    'twitter_mention'
  end

  def metric
    Metric.where(name: metric_name).first
  end

end
