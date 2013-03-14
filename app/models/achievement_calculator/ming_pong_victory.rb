module AchievementCalculator
  class MingPongVictory < AchievementCalculator::Base

    CONCERNED_WITH = 'ming_pong_victory'

    private

    def badges
      {
        1  => '1_ming_pong_victory',
        10 => '10_ming_pong_victories'
      }
    end
  end
end
