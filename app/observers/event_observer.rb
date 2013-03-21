class EventObserver < ActiveRecord::Observer

  def after_create event
    log(event)
    update_total_score_for! event
    calculate_achievements_for! event
  end

  private

  def log(event)
    Rails.logger.info "New event: #{event.inspect}"
  end

  def update_total_score_for! event
    event.user.recalculate_total_score!
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
