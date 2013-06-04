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

    def from_sha
      git_sha_match[:from_sha]
    end

    def to_sha
      git_sha_match[:to_sha]
    end

    def to_h
      {
        id:           id,
        title:        title,
        type:         type,
        improvement?: improvement?,
        published_at: published_at,
        updated_at:   updated_at,
        from_sha:     from_sha,
        to_sha:       to_sha
      }
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

    def git_sha_match
      rss_entry.link.href.match(/.*from_sha=(?<from_sha>.{8}).*to_sha=(?<to_sha>.{8})/)
    end

  end

end
