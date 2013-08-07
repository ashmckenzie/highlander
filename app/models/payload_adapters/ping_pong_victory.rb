module PayloadAdapters

  class PingPongVictory < Base

    def user
      @user ||= Services::Twitter.find_by_username(twitter_username).try(:user)
    end

    def match_id
      payload[:match_id]
    end

    def twitter_username
      payload[:winner]
    end

  end

end
