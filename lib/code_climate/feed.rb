require_relative 'entry'
require 'rss'
require 'naught'

module CodeClimate

  class Feed

    def initialize(scraper, from_date = nil)
      @scraper   = scraper
      @from_date = from_date || 1.day.ago
    end

    def update!
      @rss_feed = RSS::Parser.parse(scraper.scrape, false)
      @entries_since_from_date = nil
    end

    def updated_at
      rss_feed.updated.content
    end

    def entries
      entries_since_from_date.collect{ |e| Entry.new(e) }
    end

    def improvements
      entries.select(&:improvement?)
    end

    private

    attr_reader :scraper, :from_date

    def entries_since_from_date
      @entries_since_from_date ||= rss_feed.entries.select{ |e| e.updated.content > from_date }
    end

    def rss_feed
      @rss_feed || NullAtomFeed.new
    end

  end

end
