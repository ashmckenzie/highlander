module Services
  class PagerDuty < ActiveRecord::Base

    self.table_name = 'pager_duty_services'

    include Service

    validates :email, presence: true, uniqueness: true

  end
end
