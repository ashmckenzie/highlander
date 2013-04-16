class Badge < ActiveRecord::Base
  has_many :achievements
  has_many :users, through: :achievements

  def is_hipster_badge?
    description.downcase == 'hipster'
  end
end
