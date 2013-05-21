require 'mechanize'

module CodeClimate

  class Scraper

    LOGIN_URL = 'https://codeclimate.com/login'

    def initialize(account_info)
      @account_info = account_info
    end

    def scrape
      authenticate
      feed_page = agent.get(feed_url)
      feed_page.content
    end

    private

    attr_reader :account_info

    def authenticate
      agent.get(LOGIN_URL) do |login_page|
        login_page.form_with(method: "POST") do |f|
          f['user_session[email]']    = account_info.email
          f['user_session[password]'] = account_info.password
        end.submit
      end
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

  end

end
