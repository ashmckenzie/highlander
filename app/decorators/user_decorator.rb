class UserDecorator < Draper::Decorator
  delegate_all

  def twitter_handle
    if source.twitter_username
      "@#{source.twitter_username}"
    else
      nil
    end
  end

  def email
    hooroo_email || ''
  end

  def avatar_url size=80
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def bio
    source.bio || "#{name.split(' ').first} hasn't added a bio yet"
  end

  def id_or_slug
    source.slug.present? ? source.slug : source.id
  end

  def last_event_created_at
    if source.events.first
      "Last updated on #{source.events.first.created_at.strftime("%B %-d, %Y at %-l:%M %P")}"
    else
      ''
    end
  end
end
