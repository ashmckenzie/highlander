class UserDecorator < Draper::Decorator
  delegate_all

  def last_event_created_at
    if source.events.first
      source.events.first.created_at.strftime("%d/%m/%Y %I:%M:%S %p")
    else
      'N/A'
    end
  end
end
