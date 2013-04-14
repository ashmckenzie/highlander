class Badge < ActiveRecord::Base
  has_many :achievements
  has_many :users, through: :achievements
end
