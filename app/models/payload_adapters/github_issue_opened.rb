module PayloadAdapters

  class GithubIssueOpened < Base

    def user
      @user ||= User.find_by_github_username(github_username)
    end

    def github_username
      payload[:issue][:user][:login]
    end

    def action
      payload[:action]
    end

    private

    def payload=(payload)
      github_payload = JSON.parse(payload.delete(:payload)).to_h
      @payload = payload.merge!(github_payload)
    end

  end

end
