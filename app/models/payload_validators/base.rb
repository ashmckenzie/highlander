class PayloadError < RuntimeError

  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def message
    "#{self.class}: for payload: #{payload}"
  end

end

class InvalidMetric         < PayloadError ; end
class InvalidUserToken      < PayloadError ; end
class InvalidGitBranch      < PayloadError ; end
class TweetAlreadyProcessed < PayloadError ; end

module PayloadValidators

  class Base < SimpleDelegator

    def initialize(payload)
      super payload
    end

    def validate!
      raise InvalidMetric.new(self)     unless metric.present?
      raise InvalidUserToken.new(self)  unless user.present?
    end

  end

end
