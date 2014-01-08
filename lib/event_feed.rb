require 'singleton'

class EventFeed

  include Singleton

  def self.add!(event) instance.add!(event); end

  def add! event
    raise "#{event.inspect} is not an event!" unless event.is_a?(Event)
    RedisConnection.handle.publish :events, detailed_event(event)
  end

  private

    def detailed_event event
      EventDecorator.new(event).serialised.to_json
    end
end
