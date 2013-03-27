module PayloadAdapters

  class TwitterMention < Base

    def initialize(payload)
      @payload = payload
    end

    private

    attr_reader :payload

  end
end