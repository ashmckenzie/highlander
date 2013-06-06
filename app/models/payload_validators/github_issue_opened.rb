module PayloadValidators

  class GithubIssueOpened < Base

    def validate!
      super
      raise Errors::IssueActionNotOpened.new(payload) unless payload.action == 'opened'
    end

  end

end
