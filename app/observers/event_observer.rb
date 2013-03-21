class EventObserver < ActiveRecord::Observer

  def after_create event
    update_total_score_for! event
    calculate_achievements_for! event
  end

  private

  def update_total_score_for! event
    event.user.update(total_score: event.user.events.sum(:value))
  end

  def achievement_calculators
    [
      AchievementCalculator::FirstTime,
      AchievementCalculator::GithubPush,
      AchievementCalculator::JenkinsGreenJob,
      AchievementCalculator::MingPongVictory,
      AchievementCalculator::MingPongLoss,
      AchievementCalculator::TwitterMention
    ]
  end

  def calculate_achievements_for! event
    achievement_calculators.each do |calculator|
      calculator.new(event).calculate!
    end
  end
end
