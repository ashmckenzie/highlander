class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    case user.role
      when 'admin'
        can :manage, :all

      when 'user'
        can [ :read ], Bounty
        can [ :manage ], Bounty, :created_by_id => user.id
        can [ :edit, :update ], User, :id => user.id

      when 'guest'

    end
  end
end
