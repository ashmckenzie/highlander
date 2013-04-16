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

  end

end
