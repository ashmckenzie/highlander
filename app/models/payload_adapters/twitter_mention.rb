module PayloadAdapters

  class TwitterMention < Base

    def user
      @user ||= Services::Twitter.find_by_username(twitter_username).try(:user)
    end

    def tweet_id
      payload[:tweet_id]
    end

    def twitter_username
      payload[:twitter_username]
    end

  end

end
