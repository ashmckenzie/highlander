module DataMigration
  module MigrationFiles
    class RemoveDissusedPagerDutyBadges < Base

      def up
        Badge.find_by_name('25_pager_duty_acks').destroy
        Badge.find_by_name('50_pager_duty_acks').destroy
      end

      def down
        Badge.create!(name: '25_pager_duty_acks',  tag: "Knock knock ?  Who's there ?", description: "25 PagerDuty ack's")
        Badge.create!(name: '50_pager_duty_acks',  tag: "Ack, it's delicious", description: "50 PagerDuty ack's")
      end
    end
  end
end
