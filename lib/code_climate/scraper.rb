require 'mechanize'

module CodeClimate

  class ScraperAuthenticationError < StandardError ; end

  class Scraper

    LOGIN_URL     = 'https://codeclimate.com/login'
    DASHBOARD_URL = 'https://codeclimate.com/dashboard'

    def initialize(account_info)
      @account_info = account_info
    end

    def scrape
      authenticate!
      return agent.get(feed_url).content
    end

    private

    attr_reader :account_info

    def authenticate!
      agent.get(LOGIN_URL) do |login_page|
        login_page.form_with(method: "POST") do |f|
          f['user_session[email]']    = account_info.email
          f['user_session[password]'] = account_info.password
        end.submit
      end
      raise ScraperAuthenticationError, "Failed to log in to #{LOGIN_URL}" unless logged_in?
    end

    def agent
      @agent ||= Mechanize.new do |m|
        m.ssl_version,
        m.verify_mode = 'SSLv3',
        OpenSSL::SSL::VERIFY_NONE
      end
    end

    def feed_url
      "https://codeclimate.com/repos/#{account_info.app_id}/feed.atom"
    end

    def logged_in?
      agent.page.uri.to_s == DASHBOARD_URL
    end

  end

end
