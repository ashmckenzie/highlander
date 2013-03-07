module AchievementCalculator
  class FirstTime < AchievementCalculator::Base

    def calculate!
      if name = badges[total_score]
        add_achievement_for_badge badge_for(name)
      end
    end

    private

    def badges
      { 1 => 'first_time' }
    end

    def total_score
      user.total_score
    end
  end
end
