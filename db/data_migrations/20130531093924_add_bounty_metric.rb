module DataMigration
  module MigrationFiles
    class AddBountyMetric < Base

      def up
        Metric.create!(name: 'bounty', description: 'Bounty claimed')
      end

      def down
        Metric.find_by_name('bounty').destroy
      end
    end
  end
end
