module PayloadValidators

  class PingPongVictory < Base

    def validate!
      super
      raise Errors::PingPongWinnerAlreadyProcessed.new(payload) if winner_points_already_attributed?
    end

    def winner_points_already_attributed?
      Event.ping_pong_victories.with_key_and_value('match_id', payload.match_id).present?
    end

  end

end
