require  File.expand_path('../../pager_duty', __FILE__)
require 'net/http'
require 'ostruct'
require 'active_support/time'

class PagerDutyIntegration < Thor

  desc 'check_for_incidents', 'check PagerDuty for incidents'
  def check_for_incidents(env, api_key, subdomain, since=Time.now.yesterday.strftime('%Y-%m-%d'))
    @env = env
    @api_key = api_key
    @subdomain = subdomain
    @since = since

    pager_duty.resolved_log_entries({ since: since }).each do |log_entry|
      RestClient.post(internal_url, log_entry)
    end
  end

  private

  attr_reader :env, :api_key, :subdomain, :since

  def pager_duty
    @pager_duty ||= PagerDuty.new(api_key, subdomain)
  end

  def development?
    env == 'development'
  end

  def internal_url
    sprintf("%s:%s%s", host, port, path)
  end

  def path
    '/api/pager_duty_ack.json'
  end

  def host
    development? ? 'localhost' : 'hooroo.hilander.io'
  end

  def port
    development? ? 3000 : 80
  end
end
