module PayloadAdapters

  class GithubPush < Base

    MASTER_GIT_BRANCH = 'refs/heads/master'

    def initialize(payload)
      github_payload = JSON.parse(payload.delete(:payload)).to_h
      @payload = payload.merge!(github_payload)
    end

    private

    def user
      @user ||= User.with_email(payload[:commits].first[:author][:email])
    end

    def git_branch
      payload[:ref]
    end

  end

end
