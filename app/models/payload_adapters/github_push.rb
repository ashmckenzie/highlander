module PayloadAdapters
  class GithubPush < Base

    def self.responsible_for_params? params
      params[:commits] && params[:commits].first && params[:commits].first[:author][:email]
    end

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

  end

end
