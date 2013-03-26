class UserDecorator < Draper::Decorator
  delegate_all

  def twitter_handle
    if source.twitter_username
      "@#{source.twitter_username}"
    else
      nil
    end
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
