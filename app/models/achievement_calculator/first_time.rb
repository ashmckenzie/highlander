module AchievementCalculator

  class FirstTime < Base

    def calculate!
      return if first_time_badge.nil?

      if name = badges[total_events]
        add_achievement_for_badge badge_for(name)
      end
    end

    private

    def badges
      { 1 => 'first_time' }
    end

    def first_time_badge
      @first_time_badge ||= Badge.find_by_name('first_time')
    end

    def total_events
      user.events.count
    end
  end

end
