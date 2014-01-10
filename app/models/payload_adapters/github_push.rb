module PayloadAdapters

  class GithubPush < Base

    def user
      @user ||= Services::Github.with_email(email).try(:user)
    end

    def branch
      payload[:ref]
    end

    # TODO: use Github service username
    def email
      payload[:commits].first[:author][:email]
    end

    private

    # Gah, I hate this
    def payload=(payload)
      github_payload = JSON.parse(payload.delete(:payload)).to_h
      @payload = payload.merge!(github_payload)
    end

  end

end
