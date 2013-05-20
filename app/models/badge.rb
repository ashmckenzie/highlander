class Badge < ActiveRecord::Base
  has_many :achievements
  has_many :users, through: :achievements

  default_scope     -> { enabled.in_order }

  scope :enabled,   -> { where(enabled: true) }
  scope :in_order,  -> { order("#{table_name}.created_at ASC, #{table_name}.position ASC") }

  before_create :set_position

  include Enabler

  def is_hipster_badge?
    name == 'hipster'
  end

  private

  def set_position
    self.position = created_at.to_i
  end
end
