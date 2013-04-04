module PayloadValidators

  class Base < SimpleDelegator

    def initialize(payload)
      super payload
    end

    def validate!
      raise Exceptions::InvalidMetric.new(self)     unless metric.present?
      raise Exceptions::InvalidUserToken.new(self)  unless user.present?
    end

  end

end
