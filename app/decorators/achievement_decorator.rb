class AchievementDecorator < Draper::Decorator

  alias :achievement :source
  delegate_all

  include ActionView::Helpers::DateHelper

  def description
    achievement.description || badge.description
  end

  def tag
    achievement.achievement_tag || achievement.badge_tag
  end

  def badge_takeup
    count = (achievement.badge_takeup_count - 1)

    if count == 0 || achievement.badge.is_hipster_badge?
      'You are the only Highlander with this badge!'
    else
      (achievement.badge_takeup_count - 1).to_s << " other Highlanders have this badge"
    end
  end

  def created_at
    time_ago_in_words(achievement.created_at).capitalize
  end

end
