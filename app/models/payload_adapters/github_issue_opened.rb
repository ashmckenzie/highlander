module PayloadAdapters

  class GithubIssueOpened < Base

    def user
      @user ||= Services::Github.find_by_username(github_username).try(:user)
    end

    def github_username
      payload[:issue][:user][:login]
    end

    def action
      payload[:issue_action]
    end

  end

end
