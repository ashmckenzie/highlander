class Bounty < ActiveRecord::Base

  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :claimed_by, class_name: 'User', foreign_key: 'claimed_by_id'

  scope :created_by, -> user { where("created_by_id = ?", user.id) }

end
