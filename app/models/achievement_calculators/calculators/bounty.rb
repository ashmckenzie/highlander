module AchievementCalculators
  module Calculators
    class Bounty < Event

      event_calculator!

      def calculate!
        if metric.name == concerned_with
          add_achievement_for_badge(badge, tag)
        end
      end

      private

      def badge
        @badge ||= Badge.find_by_name('bounty_claimed')
      end

      def tag
        event.data ? event.data.fetch(:tag, badge.tag) : badge.tag
      end
    end
  end
end
