require 'rest-client'

class PagerDuty

  LOG_ENTRIES_ENDPOINT = 'https://%s.pagerduty.com/api/v1/log_entries'

  def initialize api_key, subdomain
    @api_key = api_key
    @subdomain = subdomain
  end

  def log_entries headers={}
    response = RestClient.get(log_entries_endpoint, default_headers.merge(headers))
    JSON.parse(response)['log_entries']
  end

  private

  attr_reader :api_key, :subdomain

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
