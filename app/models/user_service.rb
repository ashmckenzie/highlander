class UserService < ActiveRecord::Base

  belongs_to :service, polymorphic: true
  belongs_to :user

end
