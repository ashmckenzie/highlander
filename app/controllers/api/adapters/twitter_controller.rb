class Api::Adapters::TwitterController < Api::AdapterController

  class TweetAlreadyProcessed < RuntimeError ; end

  rescue_from TweetAlreadyProcessed do
    Rails.logger.info "Not persisting tweet '#{current_tweet[:tweet_id]}' for '#{current_tweet[:twitter_username]}' as it's already been processed"
    render text: 'Tweet already processed', status: :ok
  end

  before_filter :validate_tweet_not_already_persisted

  def create
    if new_event_for_user(metric, data: current_tweet)
      code = :ok
    else
      code = :not_found
    end

    respond_to do |format|
      format.json { head code }
    end
  end

  protected

  def current_user
    @current_user ||= User.point_earner.find_by_twitter_username!(current_tweet[:twitter_username])
  end

  private

  def current_tweet
    @current_tweet ||= params['twitter'].with_indifferent_access
  end

  def validate_tweet_not_already_persisted
    raise TweetAlreadyProcessed if Event.twitter_mentions.with_key_and_value('tweet_id', current_tweet[:tweet_id]).present?
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
