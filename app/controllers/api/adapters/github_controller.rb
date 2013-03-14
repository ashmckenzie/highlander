class Api::Adapters::GithubController < Api::AdapterController

  def create
    code = :ok
    current_user.events << Event.create(user: current_user, metric: metric)

    respond_to do |format|
      format.json { head code }
    end
  end

  private

  def payload
    JSON.parse(params[:payload])
  end

  def email_address
    payload['commits'].first['author']['email']
  end

  def metric
    Metric.where(name: 'github_push').first
  end

  def current_user
    @current_user ||= User.where(email: email_address).first
  rescue
    raise InvalidUserToken
  end
end
