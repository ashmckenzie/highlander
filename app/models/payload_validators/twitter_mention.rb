module PayloadValidators

  class TwitterMention < Base

    def validate!
      super
      raise Errors::TweetInvalid.new(payload) unless tweet_id_valid?
      raise Errors::TweetAlreadyProcessed.new(payload) if tweet_already_attributed?
    end

    def tweet_id_valid?
      !payload.tweet_id.blank?
    end

    def tweet_already_attributed?
      Event.twitter_mentions.with_key_and_value('tweet_id', payload.tweet_id).present?
    end

  end

end
