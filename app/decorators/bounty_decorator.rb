class BountyDecorator < Draper::Decorator
  delegate_all

  def claimed_at
    better_time object
  end

  def created_at
    better_time object
  end

  private

  def better_time object
    object.created_at.strftime("%m/%d/%y %H:%M")
  end

end
