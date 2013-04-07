module PayloadValidators

  class TwitterMention < Base

    def validate!
      super
      raise Errors::TweetAlreadyProcessed.new(payload) if tweet_already_attributed?
    end

    def tweet_already_attributed?
      Event.twitter_mentions.with_key_and_value('tweet_id', payload.tweet_id).present?
    end

  end

end
