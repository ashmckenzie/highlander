require 'rest-client'

class PagerDuty

  LOG_ENTRIES_ENDPOINT = 'https://%s.pagerduty.com/api/v1/log_entries'

  def initialize api_key, subdomain
    @api_key = api_key
    @subdomain = subdomain
  end

  def resolved_log_entries params
    log_entries(params).select { |x| [ 'resolve' ].include? x['type'] }
  end

  private

  attr_reader :api_key, :subdomain

  def log_entries params
    headers = default_headers.dup
    headers[:params] = params
    response = RestClient.get(log_entries_endpoint, headers)
    JSON.parse(response)['log_entries']
  end

  def default_headers
    {
      'Content-Type' => 'application/json',
      'Authorization' => "Token token=#{api_key}"
    }
  end

  def log_entries_endpoint
    sprintf(LOG_ENTRIES_ENDPOINT, subdomain)
  end

end
