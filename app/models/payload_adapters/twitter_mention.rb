module PayloadAdapters

  class TwitterMention < Base

    def user
      @user ||= begin
        if user = Services::Twitter.find_by_username(twitter_username).try(:user)
          user
        else
          user = User.create!(name: twitter_name, bio: bio, avatar_url: twitter_avatar_url)
          UserService.create!(user: user, service: Services::Twitter.new(username: twitter_username))
          user
        end
      end
    end

    def tweet_id
      payload[:tweet_id]
    end

    def twitter_username
      payload[:username]
    end

    def twitter_name
      payload[:name]
    end

    def twitter_avatar_url
      payload[:avatar_url]
    end

    def text
      payload[:text]
    end

    def bio
      payload[:bio]
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
