class Badge < ActiveRecord::Base
  has_many :achievements
  has_many :users, through: :achievements

  def is_hipster_badge?
    name == 'hipster'
  end
end
