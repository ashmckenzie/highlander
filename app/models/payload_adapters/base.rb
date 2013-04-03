module PayloadAdapters

  class Base

    delegate :validate!, to: :validator

    def initialize(payload = {})
      @payload = payload
    end

    def to_event_hash
      { metric: metric, user: user, data: data }
    end

    def to_s
      to_event_hash.to_s
    end

    def metric
      @meric ||= Metric.find_by_name(payload[:metric])
    end

    def user
      @user ||= User.with_email(payload[:email])
    end

    def data
      payload.except(*ignored_payload_keys)
    end

    private

    attr_reader :payload

    def validator
      @validator ||= Factories::PayloadValidatorFactory.for(self)
    end

    def ignored_payload_keys
      [ 'controller', 'action', 'format' ]
    end

  end

end
