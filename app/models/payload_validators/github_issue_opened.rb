module PayloadValidators
  class GithubIssueOpened < Base

    def validate!
      super
      raise Errors::IssueActionNotOpened.new(payload) unless payload.action == 'open'
    end
  end
end
