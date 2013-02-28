class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :metric

  validate :value, numericality: true
end
