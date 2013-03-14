module AchievementCalculator
  class MingPongVictory < AchievementCalculator::Base

    private

    def badges
      {
        1  => '1_ming_pong_victory',
        10 => '10_ming_pong_victories'
      }
    end
  end
end
