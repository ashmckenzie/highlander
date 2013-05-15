class UserService < ActiveRecord::Base

  belongs_to :service, polymorphic: true

  belongs_to :user

  def user_point_earner
    user.earns_points? ? user : nil
  end

end
