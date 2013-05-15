module DataMigration
  module MigrationFiles
    class SetupPagerDutyService < Base

      def up
        User.all.each do |user|
          pager_duty_service = Services::PagerDuty.new(email: user.primary_email)
          user.user_services << UserService.new(service: pager_duty_service)
        end
      end

      def down
        Services::PagerDuty.destroy_all
      end
    end
  end
end
