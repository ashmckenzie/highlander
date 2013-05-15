module Services
  class Github < ActiveRecord::Base

    self.table_name = 'github_services'

    include Service

    validates :username, presence: true, uniqueness: true
    # validates :emails, presence: true, uniqueness: true

    def self.with_email email
      where("'#{email}' = ANY (emails)").first
    end

  end
end
