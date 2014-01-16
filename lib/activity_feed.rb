module ActivityFeed

  def self.new
    ActivityFeed.new
  end

  class ActivityFeed

    ACTIVITY_FEED_LIST = 'all'
    ACTIVITY_FEED_MAX_ELEMENTS = 49   # actually 50

    def current_activity
      activity = []

      Connection.redis_handle do |h|
        activity = h.lrange(ACTIVITY_FEED_LIST, 0, ACTIVITY_FEED_MAX_ELEMENTS).map { |x| JSON.parse(x) }
      end

      activity
    end

    def subscribe channel
      Connection.redis_handle do |h|
        h.psubscribe(channel) do |on|
          yield(on)
        end
      end
    end
  end
end
