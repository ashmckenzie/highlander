module PayloadAdapters
  class GithubIssueOpened < Base

    def self.responsible_for_params? params
      params[:issue] && params[:issue][:state] == 'open'
    end

    def user
      @user ||= Services::Github.find_by_username(github_username).try(:user)
    end

    def github_username
      payload[:issue][:user][:login]
    end

    def action
      payload[:issue][:state]
    end
  end
end
