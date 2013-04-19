module PayloadAdapters
  class GithubIssueClosed < GithubIssueOpened

    def github_username
      payload[:sender][:login]
    end

  end
end
