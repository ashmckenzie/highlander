require_relative 'rating_change_details'

module CodeClimate

  ENTRY_TYPES = {
    constants_created: 'ConstantsCreated',
    rating_changed:    'RatingChanged',
    weekly_stats:      'WeeklyStats'
  }

  class Entry

    def initialize(rss_entry)
      @rss_entry = rss_entry
    end

    def id
      rss_entry.id.content
    end

    def title
      rss_entry.title.content
    end

    def type
      ENTRY_TYPES.each do |key, value|
        return key if id.include?(value)
      end
    end

    def improvement?
      rating_change_details.improvement?
    end

    def published_at
      rss_entry.published.content
    end

    def updated_at
      rss_entry.updated.content
    end

    private

    attr_reader :rss_entry

    def rating_change_details
      if type == :rating_changed
        RatingChangeDetails.new(title)
      else
        NullRatingChangeDetails.new
      end
    end

  end

end
