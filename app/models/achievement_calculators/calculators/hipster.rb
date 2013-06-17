module AchievementCalculators
  module Calculators
    class Hipster < Achievement

      achievement_calculator! position: 0

      def calculate!
        return if hipster_badge.nil?
        return if achievement_is_invalid_for_hipster_badge?
        return if achievement_is_mainstream?
        return if user_already_hipster?
        hipster!
      end

      private

      def hipster!
        ::Achievement.create!(badge: hipster_badge, user: user, tag: tag)
      end

      def tag
        "You unlocked the #{achieved_badge.description} badge before it was cool"
      end

      def hipster_badge
        @hipster_badge ||= Badge.find_by_name('hipster')
      end

      def achievement_is_invalid_for_hipster_badge?
        achieved_badge.name == hipster_badge.name
      end

      def achievement_is_mainstream?
        achievement.users.count > 1
      end

      def user_already_hipster?
        ::Achievement.where(user: user, badge: hipster_badge).count > 0
      end
    end
  end
end
