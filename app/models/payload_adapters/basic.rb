module PayloadAdapters

  class Basic

    def initialize(payload)
      @payload = payload
    end

    def valid?
      valid_metric_names.include?(metric) && email.present?
    end

    def metric
      payload[:metric]
    end

    def email
      payload[:email]
    end

    private

    attr_reader :payload

    def valid_metric_names
      Metric::NAMES
    end

  end
end
