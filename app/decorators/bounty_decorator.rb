class BountyDecorator < Draper::Decorator
  delegate_all

  def claimed_at
    better_time :claimed_at
  end

  def created_at
    better_time :created_at
  end

  private

    def better_time time_field
      object.public_send(time_field).strftime("%m/%d/%y %H:%M")
    end
end
