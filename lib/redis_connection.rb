require 'singleton'

class RedisConnection

  include Singleton

  def self.handle() instance.handle; end

  def handle
    @handle ||= Redis::Namespace.new('hilander', redis: Redis.new)
  end
end
