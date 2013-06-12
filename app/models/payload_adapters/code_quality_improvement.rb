module PayloadAdapters

  class CodeQualityImprovement < Base

    def user
      @user ||= Services::Github.find_by_username(github_username).try(:user)
    end

    def id
      payload[:id]
    end

    def github_username
      payload[:user]
    end

  end

end