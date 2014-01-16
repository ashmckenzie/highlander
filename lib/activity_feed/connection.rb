require 'singleton'

module ActivityFeed
  class Connection

    include Singleton

    NAMESPACE = 'activity-feed'

    def self.namespace() instance.namespace; end
    def self.redis_handle(&blk) instance.redis_handle(&blk); end

    def namespace
      @namespace ||= "#{RedisConnection.handle.namespace}:#{NAMESPACE}"
    end

    def redis_handle &blk
      if block_given?
        RedisConnection.handle.namespace(namespace) do |h|
          blk.call(h)
        end
      else
        h = nil
        RedisConnection.handle.namespace(namespace) { |x| h = x }
        h
      end
    end
  end
end
