class Api::Adapters::TwitterController < Api::AdapterController

  def create
    if current_tweet_already_persisted? || new_event_for_user(metric)
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
    @current_user ||= User.point_earner.find_by_twitter_username!(current_tweet[:twitter_username])
  rescue
    raise InvalidUserToken
  end

  private

  def current_tweet
    @current_tweet ||= params['twitter']
  end

  def current_tweet_already_persisted?
    Event.twitter_mentions.with_key_and_value('tweet_id', current_tweet['tweet_id'])
  end

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
