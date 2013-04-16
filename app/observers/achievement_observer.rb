class AchievementObserver < ActiveRecord::Observer

  def after_create achievement
    log(achievement)
    calculate_achievements_for! achievement
  end

  private

  def log(achievement)
    Rails.logger.info "New achievement: #{achievement.inspect}"
  end

  def achievement_calculators
    [
      AchievementCalculator::Hipster
    ]
  end

  def calculate_achievements_for! achievement
    achievement_calculators.each do |calculator|
      calculator.new(achievement).calculate!
    end
  end
end
