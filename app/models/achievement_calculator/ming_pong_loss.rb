module AchievementCalculator
  class MingPongLoss < AchievementCalculator::Base

    CONCERNED_WITH = 'ming_pong_loss'

    def calculate!
      if metric.name == CONCERNED_WITH && name = badges[total_event_count]
        add_achievement_for_badge badge_for(name)
      end
    end

    private

    attr_reader :event

    def badges
      { 1 => '1_ming_pong_loss' }
    end
  end
end
