module AchievementCalculator
  class MingPongLoss < AchievementCalculator::Base

    CONCERNED_WITH = 'ming_pong_loss'

    private

    def badges
      { 1 => '1_ming_pong_loss' }
    end
  end
end
