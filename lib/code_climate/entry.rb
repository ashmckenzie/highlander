module CodeClimate

  class Entry

    def initialize(rss_entry)
      @rss_entry = rss_entry
    end

    def id
      rss_entry.id.content
    end

    private

    attr_reader :rss_entry

  end

end
