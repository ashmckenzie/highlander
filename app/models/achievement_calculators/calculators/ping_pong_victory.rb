module AchievementCalculators
  module Calculators
    class PingPongVictory < Event

      event_calculator!

      private

      def badges
        {
          1  => '1_ping_pong_victory',
          10 => '10_ping_pong_victories',
          100 => '100_ping_pong_victories'
        }
      end
    end

  end

end
