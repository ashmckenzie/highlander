module PayloadAdapters

  class TwitterMention < Base

    def user
      @user ||= User.point_earner.find_by_twitter_username(twitter_username)
    end

    def tweet_id
      payload[:tweet_id]
    end

    def twitter_username
      payload[:twitter_username]
    end

  end

end
