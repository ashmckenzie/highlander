module PayloadValidators

  class GithubIssueClosed < Base

    def validate!
      super
      raise Errors::IssueActionNotClosed.new(payload) unless payload.action == 'closed'
    end

  end

end
