class Metric < ActiveRecord::Base

  has_one :event

  validate :default_unit, numericality: true

end
