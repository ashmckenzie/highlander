module PayloadValidators

  class Base < SimpleDelegator

    def initialize(payload)
      super payload
    end

    def validate!
      raise Exceptions::InvalidMetric.new(self)         unless metric.present?
      raise Exceptions::InvalidUserToken.new(self)      unless user.present?
      raise Exceptions::InvalidRequestSource.new(self)  unless request_ip_address_valid?
    end

    private

    def request_ip_address_valid?
      return true if valid_request_sources.empty?

      valid_request_sources.each do |ip_range|
        return true if ip_range.include?(request_ip_address)
      end

      false
    end

    def valid_request_sources
      []
    end

  end

end
