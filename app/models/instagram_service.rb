class InstagramService < ActiveRecord::Base

  has_one :user_service, :as => :service, dependent: :destroy

  validates :username, presence: true, uniqueness: true

end
