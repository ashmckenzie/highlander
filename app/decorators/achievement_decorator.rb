class AchievementDecorator < Draper::Decorator

  delegate_all

  include ActionView::Helpers::DateHelper

  def description
    source.description || badge.description
  end

  def tag
    source.tag || badge.tag
  end

  def created_at
    time_ago_in_words(source.created_at).capitalize
  end

end
