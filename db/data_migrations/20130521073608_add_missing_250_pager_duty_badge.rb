module DataMigration
  module MigrationFiles
    class AddMissing250PagerDutyBadge < Base

      def up
        Badge.create!(name: '250_pager_duty_acks',  tag: "Admiral Ackbah is pleased with you", description: "250 PagerDuty ack's")
      end

      def down
        Badge.find_by_name('250_pager_duty_acks').destroy
      end
    end
  end
end
