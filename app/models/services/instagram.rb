module Services
  class Instagram < ActiveRecord::Base

    self.table_name = 'instagram_services'

    include Service

    validates :username, presence: true, uniqueness: true

  end
end
