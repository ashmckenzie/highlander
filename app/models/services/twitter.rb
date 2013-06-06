module Services
  class Twitter < ActiveRecord::Base

    self.table_name = 'twitter_services'

    include Service

    validates :username, presence: true, uniqueness: true

  end
end
