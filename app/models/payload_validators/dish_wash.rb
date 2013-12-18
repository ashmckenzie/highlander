module PayloadValidators

  class DishWash < Base

    def validate!
      super
      raise Errors::DishWashAlreadyRegistered.new(payload) if dish_wash_already_registered?
    end

    def dish_wash_already_registered?
      Event.dish_washes.with_key_and_value('user_id', payload.user.id).where(['events.created_at > ?', 2.minutes.ago]).count > 0 ? true : false
    end

  end

end
