module Factories

  class PayloadAdapterFactory

    def self.for(payload)
      "PayloadAdapters::#{payload[:metric].camelize}".constantize.new(payload)
    rescue NameError
      PayloadAdapters::Base.new(payload)
    end

    private_class_method :new

  end

end
