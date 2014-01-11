module Factories
  class PayloadAdapterFactory

    def self.for params
      metric = metric_from(params)
      "PayloadAdapters::#{metric.camelize}".constantize.new(params)
    rescue NameError
      PayloadAdapters::Base.new(params)
    end

    def self.metric_from params
      if params[:metric]
        params[:metric]
      else
        Metric::NAMES.detect do |metric_name|
          "PayloadAdapters::#{metric_name.camelize}".constantize.responsible_for_params?(params)
        end
      end
    end

    private_class_method :new

  end
end
