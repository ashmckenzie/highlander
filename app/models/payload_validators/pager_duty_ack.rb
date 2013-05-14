module PayloadValidators

  class PagerDutyAck < Base

    def validate!
      super
      raise Errors::PagerDutyAckAlreadyProcessed.new(payload) if ack_already_attributed?
    end

    def ack_already_attributed?
      Event.pager_duty_acks.with_key_and_value('id', payload.ack_id).present?
    end

  end

end
