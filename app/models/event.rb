class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :metric

  validate :value, numericality: true

  Metric::NAMES.each do |metric|
    scope metric.pluralize.to_sym, -> { joins(:metric).where("metrics.name = '#{metric}'") }
  end

  class << self

    def with_key_and_value(key, value)
      where("data @> '#{key}=>#{value}'")
    end

  end

end
