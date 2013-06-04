require 'naught'

module CodeClimate

  class RatingChangeDetails

    def initialize(entry_title)
      @entry_title = entry_title
    end

    def improvement?
      entry_title.include? 'improved'
    end

    def old_rating
      rating_change_match[:old_rating]
    end

    def new_rating
      rating_change_match[:new_rating]
    end

    def rating_jump
      Range.new(*sorted_ratings).to_a.size - 1
    end

    private

    attr_reader :entry_title

    def rating_change_match
      entry_title.match(/from a (?<old_rating>[A-F]) to a (?<new_rating>[A-F])/)
    end

    def sorted_ratings
      [ old_rating, new_rating ].sort
    end

  end

  NullRatingChangeDetails = Naught.build do |config|
    config.mimic RatingChangeDetails
  end

end
