class Event < ActiveRecord::Base

  belongs_to :user
  belongs_to :metric

  validate :value, numericality: true

  Metric.all.collect(&:name).each do |metric|
    scope metric.pluralize.to_sym, -> { joins(:metric).where("metrics.name = '#{metric}'") }
  end

end
