module AchievementCalculators
  module Calculators
    class Achievement

      def initialize achievement
        @achievement = achievement
      end

      def calculate!
        raise NotImplementedError
      end

      def self.achievement_calculator!(position: -1)
        AchievementCalculators::Base.instance.register_achievement_calculator!(self, position)
      end

      private

      attr_reader :achievement

      def user
        achievement.user
      end

      def achieved_badge
        achievement.badge
      end
    end
  end
end
