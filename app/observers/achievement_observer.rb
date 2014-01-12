class AchievementObserver < ActiveRecord::Observer

  def after_create achievement
    log(achievement)
    add_to_activity_feed!(achievement)

    # Yes, this looks crazy, but you can earn achievements for an achievement.
    #
    # eg. Hipster badges
    #
    calculate_achievements_for!(achievement)
  end

  private

  def log(achievement)
    Rails.logger.info "New achievement: #{achievement.inspect}"
  end

  def achievement_calculators
    AchievementCalculators::Base.instance.achievement_calculators
  end

  def calculate_achievements_for! achievement
    achievement_calculators.each do |calculator|
      calculator.new(achievement).calculate!
    end
  end

  def add_to_activity_feed! achievement
    ActivityFeed.new.add!(achievement)
  end
end
