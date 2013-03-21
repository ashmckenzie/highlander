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

    def with_key_and_value(key, value)
      # http://schneems.com/post/19298469372/you-got-nosql-in-my-postgres-using-hstore-in-rails
      # WTF
      where("data @> (:key => :value)", :key => key, :value => value)
    end

  end

  def inspect
    "Event(user: #{user.name}, metric: #{metric.name})"
  end

end
