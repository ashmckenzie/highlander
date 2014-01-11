module PayloadAdapters
  class Base

    delegate :validate!,  to: :validator
    delegate :valid?,     to: :validator

    def initialize(payload)
      self.payload = payload  # gah, do not change this :(  see PayloadAdapters::GitHubPush#payload=
    end

    def self.responsible_for_params? params
      false
    end

    def to_event_hash
      {
        user:   user,
        metric: metric,
        value:  value || metric.default_unit,
        data:   data
      }
    end

    def to_s
      to_event_hash.to_s
    end

    def metric_name
      if payload[:metric]
        payload[:metric]
      else
        self.class.to_s.demodulize.underscore
      end
    end

    def metric
      @meric ||= Metric.find_by_name(metric_name)
    end

    def user
      @user ||= User.with_email(payload[:email])
    end

    def data
      @data ||= payload.except(*ignored_payload_keys)
    end

    def request_ip_address
      @request_ip_address ||= IPAddr.new(payload[:request_ip_address])
    end

    private

      attr_accessor :payload

      def validator
        @validator ||= Factories::PayloadValidatorFactory.for(self)
      end

      def ignored_payload_keys
        [ 'controller', 'action', 'format' ]
      end

      def value
        nil
      end
  end
end
