class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :metric

  validate :value, numericality: true

  # Event.twitter_mentions etc
  Metric.all.collect(&:name).each do |metric|
    scope metric.pluralize.to_sym, -> { joins(:metric).where("metrics.name = '#{metric}'") }
  end

  class << self

    def with_key(key)
      where("data ? :key", :key => key)
    end

    def with_value(value)
      where("data ? :value", :value => value.to_s)
    end

    def with_key_and_value(key, value)
      with_key(key).with_value(value)
    end

  end

  def inspect
    "Event(user: #{user.name}, metric: #{metric.name})"
  end

end
