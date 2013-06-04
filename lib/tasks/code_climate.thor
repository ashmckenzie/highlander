require File.expand_path('../../code_climate/load.rb', __FILE__)
require 'octokit'
require 'pry'

class CodeClimateIntegration < Thor

  desc 'scrape_activity_feed', 'Scrapes the Code Climate feed'
  method_options force: :boolean
  def scrape_activity_feed(app_id, email, password)

    account_info = CodeClimate::AccountInfo.new(
      app_id:   app_id,
      email:    email,
      password: password
    )

    scraper   = CodeClimate::Scraper.new(account_info)
    from_date = DateTime.parse('1900-01-01') if options.force?

    feed      = CodeClimate::Feed.new(scraper, from_date)

    feed.update!

    feed.improvements.each do |entry|
      puts entry
    end

  end
end
