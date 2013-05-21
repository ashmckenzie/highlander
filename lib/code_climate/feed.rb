require_relative 'scraper'
require_relative 'entry'
require 'rss'

module CodeClimate

  class Feed

    def initialize(scraper)
      @scraper = scraper
    end

    def update!
      @rss_feed = RSS::Parser.parse(scraper.scrape, false)
    end

    def updated_at
      rss_feed.updated.content
    end

    def entries
      rss_feed.entries.collect { |entry| Entry.new(entry) }
    end

    private

    attr_reader :scraper

    def rss_feed
      @rss_feed || NullAtomFeed.new
    end

  end

  class NullAtomFeed < RSS::Atom::Feed

    def initialize
      super
      self.updated = Time.new
    end

  end

end
