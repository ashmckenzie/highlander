class AchievementDecorator < Draper::Decorator
  alias :achievement :source

  delegate_all
  delegate :name, :tag, to: :badge

  include ActionView::Helpers::DateHelper

  def description
    achievement.description || badge.description
  end

  def created_at
    time_ago_in_words(achievement.created_at).capitalize
  end

  private

  def badge
    @badge ||= achievement.badge
  end

end
