module ActivityFeed
  class Submit

    def initialize object
      @object = object
      raise "#{object.inspect} cannot be added!" unless object_has_valid_decorator?
    end

    def add!
      push_to_channel!
      add_to_global_list!
    end

    private

      attr_reader :object

      def handle &blk
        Connection.redis_handle do |h|
          blk.call(h)
        end
      end

      def push_to_channel!
        handle do |h|
          h.publish(channel, detailed_object)
        end
      end

      def add_to_global_list!
        handle do |h|
          h.lpush(ActivityFeed::ACTIVITY_FEED_LIST, detailed_object)
          h.ltrim(ActivityFeed::ACTIVITY_FEED_LIST, 0, ActivityFeed::ACTIVITY_FEED_MAX_ELEMENTS)
        end
      end

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
