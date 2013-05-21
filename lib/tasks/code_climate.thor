require File.expand_path('../../code_climate/feed', __FILE__)
require File.expand_path('../../code_climate/account_info', __FILE__)

class CodeClimateIntegration < Thor

  desc 'scrape_activity_feed', 'Scrapes the Code Climate feed'
  def scrape_activity_feed(app_id = '51233ac356b10216a600183f', email = 'highlander@hooroo.com', password = 'thequickening')

    account_info = CodeClimate::AccountInfo.new(
      app_id:   app_id,
      email:    email,
      password: password
    )

    scraper = CodeClimate::Scraper.new(account_info)
    feed = CodeClimate::Feed.new(scraper)

    feed.entries
    #=> []

    feed.update!

    feed.entries
    #=> [ some entries, bitch! ]

  end
end
