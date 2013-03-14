class Api::Adapters::GithubController < Api::AdapterController

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

  def payload
    JSON.parse(params[:payload])
  end

  def email
    payload['commits'].first['author']['email']
  end

  def metric
    Metric.where(name: 'github_push').first
  end
end
