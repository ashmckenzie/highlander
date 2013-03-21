class UserDecorator < Draper::Decorator
  delegate_all

  def twitter_handle
    if source.twitter_username
      "@#{source.twitter_username}"
    else
      nil
    end
  end

  def last_event_created_at
    if source.events.first
      source.events.first.created_at.strftime("%d/%m/%y %k:%M")
    else
      ''
    end
  end
end
