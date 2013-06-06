class Achievement < ActiveRecord::Base

  belongs_to :user
  belongs_to :badge
  has_many   :users, through: :badge

  delegate :name, to: :badge, prefix: true

end
