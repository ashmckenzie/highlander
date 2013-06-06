require File.expand_path('../../code_climate/load.rb', __FILE__)
require 'pry'

class CodeClimateIntegration < Thor

  desc 'scrape_activity_feed', 'Scrapes the Code Climate feed'
  method_options force: :boolean
  def scrape_activity_feed(app_id, email, password, from_date = 1.day.ago)

    account_info = CodeClimate::AccountInfo.new(
      app_id:   app_id,
      email:    email,
      password: password
    )

    scraper = CodeClimate::Scraper.new(account_info)
    feed = CodeClimate::Feed.new(scraper)

    feed.update!

    feed.improvements.each do |entry|
      puts entry
    end

  end
end
