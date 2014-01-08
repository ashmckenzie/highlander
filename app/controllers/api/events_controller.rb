module Api

  class EventsController < BaseController
    respond_to :json

    skip_before_filter  :verify_authenticity_token
    before_filter :validate_payload!

    def create
      respond_to do |format|
        format.json { head create_event! }
      end
    end

    private

      def create_event!
        if Event.create(payload.to_event_hash)
          :ok
        else
          :not_found
        end
      end

      def validate_payload!
        payload.validate!
      end

      def payload
        @payload ||= Factories::PayloadAdapterFactory.for(params)
      end

  end

end
