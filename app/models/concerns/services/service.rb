module Services
  module Service
    extend ActiveSupport::Concern

    included do
      has_one :user_service, :as => :service, dependent: :destroy
      has_one :user, through: :user_service
    end
  end
end
