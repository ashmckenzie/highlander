module Api

  class EventsController < BaseController
    respond_to :json

    before_filter :validate_payload!

    def create
      if Event.create(payload.to_event_hash)
        code = :ok
      else
        code = :not_found
      end

      respond_with status: code
    end

    private

    def validate_payload!
      payload.validate!
    end

    def payload
      @payload ||= Factories::PayloadAdapterFactory.for(params)
    end

  end

end
