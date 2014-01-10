class Feed

  def initialize object
    @object = object
    raise "#{object.inspect} cannot be added!" unless object_has_valid_decorator?
  end

  def add!
    RedisConnection.handle.publish channel, detailed_object
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
