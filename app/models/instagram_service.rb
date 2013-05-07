class InstagramService < ActiveRecord::Base

  has_one :user_service, :as => :service, dependent: :destroy

  validates_presence_of :username

end
