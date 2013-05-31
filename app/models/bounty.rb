class Bounty < ActiveRecord::Base

  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :claimed_by, class_name: 'User', foreign_key: 'claimed_by_id'

  validate :ensure_not_claimed
  validate :ensure_max_active_bounties

  validates :name, :description, :reward, presence: true
  validates :name, uniqueness: true
  validates :reward, inclusion: { in: 5..10 , message: "must be between 5 and 10" }

  scope :unclaimed, -> { where("claimed_by_id IS NULL AND claimed_at IS NULL") }

  MAX_ACTIVE_BOUNTIES = 2

  def claimed?
    claimed_by && claimed_at ? true : false
  end

  private

  def ensure_not_claimed
    errors.add(:claimed_by, "Already claimed by #{claimed_by.name}") if (attributes['claimed_by'] && attributes['claimed_at'])
  end

  def ensure_max_active_bounties
    errors.add(:id, "You can only have #{self.class::MAX_ACTIVE_BOUNTIES} bounties at any one time") if self.class.unclaimed.where("created_by_id = #{self.created_by_id}").count > self.class::MAX_ACTIVE_BOUNTIES
  end
end
