module Exceptions

  class ApiError < RuntimeError

    attr_reader :payload

    def initialize(payload)
      @payload = payload
    end

    def message
      "#{self.class}: for payload: #{payload}"
    end

  end

  class InvalidMetric         < ApiError ; end
  class InvalidUserToken      < ApiError ; end
  class InvalidGitBranch      < ApiError ; end
  class TweetAlreadyProcessed < ApiError ; end
  class InvalidRequestSource  < ApiError ; end

end