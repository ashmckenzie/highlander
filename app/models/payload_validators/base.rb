module PayloadValidators

  class Base

    def initialize(payload)
      @payload = payload
    end

    def validate!
      raise Errors::InvalidMetric.new(payload)        unless payload.metric.present?
      raise Errors::UserNotFound.new(payload)         unless payload.user.present?
      raise Errors::UserNotPointEarner.new(payload)   unless payload.user.earns_points?
      raise Errors::InvalidRequestSource.new(payload) unless request_ip_address_valid?
    end

    private

    attr_reader :payload

    def request_ip_address_valid?
      return true if valid_request_sources.empty?

      valid_request_sources.each do |ip_range|
        return true if ip_range.include?(payload.request_ip_address)
      end

      false
    end

    def valid_request_sources
      []
    end

  end

end
