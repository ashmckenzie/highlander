class Badge < ActiveRecord::Base

  include Enabler
  include Slugger

  has_many :achievements
  has_many :users, through: :achievements

  default_scope     -> { enabled.in_order }

  scope :in_order,  -> { order("#{table_name}.created_at ASC, #{table_name}.position ASC") }

  before_create :set_position

  def is_hipster_badge?
    name == 'hipster'
  end

  def is_bounty_badge?
    name == 'bounty_claimed'
  end

  def to_param
    slug
  end

  private

  def set_position
    self.position = created_at.to_i
  end
end
