module DataMigration
  module MigrationFiles
    class AddBountyMetric < Base

      def up
        Metric.create!(name: 'bounty', description: 'Bounty up for grabs!')
      end

      def down
        Metric.find_by_name('bounty').destroy
      end
    end
  end
end
