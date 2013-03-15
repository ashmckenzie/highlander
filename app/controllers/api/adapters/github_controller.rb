class Api::Adapters::GithubController < Api::AdapterController

  before_filter :validate_request_source

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
    begin
      @current_user ||= User.with_email(email)
    rescue
      raise InvalidUserToken
    end
  end

  private

  def valid_metrics
    %w{ github_push }
  end

  def valid_request_sources
    %w{
      207.97.227.253/32
      50.57.128.197/32
      108.171.174.178/32
      50.57.231.61/32
      204.232.175.64/27
      192.30.252.0/22

    }.map do |ip|
     IPAddr.new(ip).to_range
    end
  end

  def payload
    JSON.parse(params[:payload])
  end

  def email
    payload['commits'].first['author']['email']
  end

  def metric_name
    'github_push'
  end

  def metric
    Metric.where(name: metric_name).first
  end
end
