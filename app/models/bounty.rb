class Bounty < ActiveRecord::Base

  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :claimed_by, class_name: 'User', foreign_key: 'claimed_by_id'

  validate :ensure_not_claimed

  def claimed?
    claimed_by && claimed_at ? true : false
  end

  private

  def ensure_not_claimed
    errors.add(:claimed_by, "already claimed by #{claimed_by.name}") if (attributes['claimed_by'] && attributes['claimed_at'])
  end
end
