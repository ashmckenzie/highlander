require_relative 'entry'
require 'rss'
require 'naught'

module CodeClimate

  class Feed

    def initialize(scraper)
      @scraper = scraper
    end

    def updated_at
      rss_feed.updated.content
    end

    def entries
      rss_feed.entries.collect { |entry| Entry.new(entry) }
    end

    def improvements
      entries.select(&:improvement?)
    end

    def update!
      @rss_feed = RSS::Parser.parse(scraper.scrape, false)
    end

    private

    attr_reader :scraper

    def rss_feed
      @rss_feed || NullAtomFeed.new
    end

  end

  NullAtomFeed = Naught.build do
    def entries
      []
    end
  end

end
