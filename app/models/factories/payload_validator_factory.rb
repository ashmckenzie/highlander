module Factories

  class PayloadValidatorFactory

    def self.for(payload)
      "PayloadValidators::#{payload.class.to_s.demodulize.camelize}".constantize.new(payload)
    rescue NameError
      PayloadValidators::Base.new(payload)
    end

    private_class_method :new

  end

end
