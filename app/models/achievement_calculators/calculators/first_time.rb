module AchievementCalculators
  module Calculators
    class FirstTime < Event

      event_calculator! position: 0

      def calculate!
        if name = badges[total_events]
          add_achievement_for_badge badge_for(name)
        end
      end

      private

      def badges
        { 1 => 'first_time' }
      end

      def total_events
        user.events.count
      end
    end
  end
end
