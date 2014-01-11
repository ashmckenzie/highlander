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

    def text
      payload[:text]
    end

    private

      def value
        return 10 if content.high_value?
      end

      def content
        @content ||= TweetContent.new(text)
      end
  end
end
