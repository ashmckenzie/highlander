class AchievementDecorator < Draper::Decorator

  alias :achievement :source
  delegate_all

  include ActionView::Helpers::DateHelper

  def description
    achievement.description.blank? ? badge.description : badge.description
  end

  def tag
    achievement_tag.blank? ? badge_tag : achievement_tag.truncate(70, separator: ' ', omission: '…')
  end

  def badge_tag
    # Ugh, this sucks
    if achievement.respond_to?(:badge_tag)
      achievement.badge_tag
    else
      badge.tag
    end
  end

  def achievement_tag
    # Ugh, this sucks
    if achievement.respond_to?(:achievement_tag)
      achievement.achievement_tag
    else
      achievement.tag
    end
  end

  def badge_takeup
    count = (achievement.badge_takeup_count - 1)

    if count == 0 || achievement.badge.is_hipster_badge? || achievement.badge.is_bounty_badge?
      'The only Hilander with this badge!'
    else
      possession = count == 1 ? 'has' : 'have'
      h.pluralize(count, 'other Hilander') << " #{possession} this badge"
    end
  end

  def created_at
    time_ago_in_words(achievement.created_at).capitalize
  end

  def serialised
    {
      id: id,
      description: description,
      tag: tag,
      user: {
        id: decorated_user.id,
        name: decorated_user.name,
        avatar_url: decorated_user.avatar_url
      },
      badge: {
        id: decorated_badge.id,
        name: decorated_badge.name,
        description: decorated_badge.description,
        tag: decorated_badge.tag,
        image_url: decorated_badge.image_url
      },
      created_at: created_at,
      updated_at: updated_at
    }
  end

  private

    def decorated_user
      @decorated_user ||= UserDecorator.new(user)
    end

    def decorated_badge
      @decorated_badge ||= BadgeDecorator.new(badge)
    end

end
