module PayloadAdapters

  class MingPongVictory < Base

    def user
      @current_user ||= User.point_earner.find_by_twitter_username(twitter_username)
    end

    def match_id
      payload[:match_id]
    end

    def twitter_username
      payload[:winner]
    end

  end

end
