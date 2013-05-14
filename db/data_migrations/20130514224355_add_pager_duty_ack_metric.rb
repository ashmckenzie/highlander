module DataMigration
  module MigrationFiles
    class AddPagerDutyAckMetric < Base

      def up
        Metric.create!(name: 'pager_duty_ack', description: 'Pager Duty ack')
      end

      def down
        Metric.find_by_name('pager_duty_ack').destroy
      end
    end
  end
end
