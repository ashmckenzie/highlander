class UserDecorator < Draper::Decorator

  alias :user :source
  delegate_all

  def twitter_handle
    "@#{user.service_for(:twitter).username}" if user.service_for(:twitter)
  end

  def email
    hooroo_email || ''
  end

  def avatar_email
    user.avatar_email || email
  end

  def achievements
    Queries::AchievementsAndBadgeTakeupForUser.new(user).query.decorate
  end

  def avatar_url size=80
    # gravatar_id = Digest::MD5::hexdigest(avatar_email).downcase
    # "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    user.avatar_url
  end

  def bio
    user.bio || "#{first_name} hasn't added a bio yet"
  end

  def first_name
    name.split(' ').first
  end

  def id_or_slug
    user.slug.present? ? user.slug : user.id
  end

  def last_event_created_at
    if user.events.first
      "Last updated on #{user.events.first.created_at.strftime("%B %-d, %Y at %-l:%M %P")}"
    else
      ''
    end
  end
end
