class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can [ :edit, :update ], User, :id => user.id
  end
end
