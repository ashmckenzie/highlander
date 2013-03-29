class InvalidMetric     < RuntimeError ; end
class InvalidUserToken  < RuntimeError ; end

module PayloadAdapters

  class Basic

    attr_accessor :payload

    def initialize(payload: {})
      @payload = payload
    end

    def metric_name
      payload[:metric]
    end

    def user
      User.with_email(email)
    end

    def validate!
      raise InvalidMetric     unless valid_metric_names.include?(metric_name)
      raise InvalidUserToken  unless email.present?
    end

    private

    def email
      payload[:email]
    end

    def valid_metric_names
      Metric::NAMES
    end

  end
end
