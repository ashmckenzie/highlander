module PayloadValidators

  class TwitterMention < Base

    def validate!
      super
      raise Exceptions::TweetAlreadyProcessed.new(self) if tweet_already_attributed?
    end

    def tweet_already_attributed?
      Event.twitter_mentions.with_key_and_value('tweet_id', tweet_id).present?
    end

  end

end
