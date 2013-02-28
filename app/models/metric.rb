class Metric < ActiveRecord::Base
  validate :default_unit, numericality: true
end
