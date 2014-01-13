require 'singleton'

class ActivityFeed

  def subscribe channel
    Connection.instance.redis_handle do |handle|
      handle.psubscribe(channel) do |on|
        yield(on)
      end
    end
  end

  class Connection

    include Singleton

    NAMESPACE = 'activity-feed'

    def self.namespace() instance.namespace; end
    def self.redis_handle(&blk) instance.redis_handle(blk); end

    def namespace
      @namespace ||= "#{RedisConnection.handle.namespace}:#{NAMESPACE}"
    end

    def redis_handle &blk
      RedisConnection.handle.namespace(namespace) { |handle| blk.call(handle) }
    end
  end

  class Submit
    def initialize object
      @object = object
      raise "#{object.inspect} cannot be added!" unless object_has_valid_decorator?
    end

    def add!
      Connection.instance.redis_handle do |handle|
        handle.publish(channel, detailed_object)
      end
    end

    private

      attr_reader :object

      def object_has_valid_decorator?
        object.respond_to?(:decorate) && decorated_object.respond_to?(:serialised)
      end

      def channel
        object.class.to_s.underscore.dasherize.pluralize
      end

      def decorated_object
        @decorated_object ||= object.decorate
      end

      def detailed_object
        decorated_object.serialised.to_json
      end
  end
end
