module AchievementCalculators
  module Calculators
    class MingPongVictory < Event

      event_calculator!

      private

      def badges
        {
          1  => '1_ming_pong_victory',
          10 => '10_ming_pong_victories',
          100 => '100_ming_pong_victories'
        }
      end
    end

  end

end
