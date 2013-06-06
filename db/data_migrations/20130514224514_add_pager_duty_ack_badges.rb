module DataMigration
  module MigrationFiles
    class AddPagerDutyAckBadges < Base

      def up
        Badge.create!(name: '1_pager_duty_ack',    tag: "Hope I didn't interrupt dinner?", description: 'First PagerDuty ack')
        Badge.create!(name: '25_pager_duty_acks',  tag: "Knock knock ?  Who's there ?", description: "25 PagerDuty ack's")
        Badge.create!(name: '50_pager_duty_acks',  tag: "Ack, it's delicious", description: "50 PagerDuty ack's")
        Badge.create!(name: '100_pager_duty_acks', tag: 'Ack centurion!', description: "100 PagerDuty ack's")
        Badge.create!(name: '500_pager_duty_acks', tag: "Slow down girl/boy you're about to Ack somebody", description: "500 PagerDuty ack's")
      end

      def down
        Badge.find_by_name('1_pager_duty_ack').destroy
        Badge.find_by_name('25_pager_duty_acks').destroy
        Badge.find_by_name('50_pager_duty_acks').destroy
        Badge.find_by_name('100_pager_duty_acks').destroy
        Badge.find_by_name('500_pager_duty_acks').destroy

        Badge.find_by_name('1_pager_duty_ack_').destroy
        Badge.find_by_name('25_pager_duty_acks').destroy
        Badge.find_by_name('50_pager_duty_acks').destroy
        Badge.find_by_name('100_pager_duty_acks').destroy
        Badge.find_by_name('500_pager_duty_acks').destroy
      end
    end
  end
end
