class Bounty < ActiveRecord::Base

  include Slugger

  attr_reader :user_performing_claim

  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  belongs_to :claimed_by, class_name: 'User', foreign_key: 'claimed_by_id'

  validate :ensure_not_claimed
  validate :ensure_max_active_bounties, on: :create
  validate :ensure_reward_amount_is_valid, on: :create
  validate :ensure_no_self_claim, on: :update

  validates :name, :description, :reward, presence: true, uniqueness: true

  scope :claimed, -> { where("claimed_by_id IS NOT NULL AND claimed_at IS NOT NULL") }
  scope :unclaimed, -> { where("claimed_by_id IS NULL AND claimed_at IS NULL") }
  scope :created_by, -> user { where("created_by_id = ?", user.id) }

  MAX_ACTIVE_BOUNTIES = 2

  def self.has_max_allowed? user
    !user.admin? && self.unclaimed.created_by(user).count >= self::MAX_ACTIVE_BOUNTIES
  end

  def claimed?
    claimed_by && claimed_at ? true : false
  end

  def update attrs, user_performing_claim
    self.user_performing_claim = user_performing_claim
    super(attrs)
  end

  def save_with_user user_performing_claim
    self.user_performing_claim = user_performing_claim
    save
  end

  private

    attr_writer :user_performing_claim

    def ensure_reward_amount_is_valid
      errors.add(:reward, "Reward value must be between 5 and 10") if !user_performing_claim.admin? && (attributes['reward'].to_i < 5 || attributes['reward'].to_i > 10)
    end

    def ensure_not_claimed
      errors.add(:claimed_by, "Already claimed by #{claimed_by.name}") if (attributes['claimed_by'] && attributes['claimed_at'])
    end

    def ensure_max_active_bounties
      if !user_performing_claim.admin? && self.class.unclaimed.where("created_by_id = #{self.created_by_id}").count >= MAX_ACTIVE_BOUNTIES
        message = "can only have #{MAX_ACTIVE_BOUNTIES} unclaimed bounties at any one time"
        errors.add(:you, message)
        return false
      end
    end

    def ensure_no_self_claim
      if !user_performing_claim.admin? && claimed_by == created_by
        errors.add(:claimed_by_id, "cannot be yourself, that's cheating!")
      end
    end
end
