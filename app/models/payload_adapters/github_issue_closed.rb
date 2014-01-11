module PayloadAdapters
  class GithubIssueClosed < GithubIssueOpened

    def self.responsible_for_params? params
      params[:issue] && params[:issue][:state] == 'closed'
    end

    def github_username
      payload[:sender][:login]
    end

  end
end
