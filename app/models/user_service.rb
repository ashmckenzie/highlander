class UserService < ActiveRecord::Base

  belongs_to :service, polymorphic: true, dependent: :destroy

end
