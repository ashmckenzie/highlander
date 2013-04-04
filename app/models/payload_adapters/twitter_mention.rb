module PayloadAdapters

  class TwitterMention < Base

    def user
      @current_user ||= User.point_earner.find_by_twitter_username!(payload[:twitter][:twitter_username])
    end

  end

end
