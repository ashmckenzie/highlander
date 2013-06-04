module DataMigration
  module MigrationFiles
    class AddCodeClimateMetric < Base

      def up
        Metric.create!(name: 'code_climate_improvement', description: 'Code Climate Improvement', default_unit: 10)
      end

      def down
        Metric.find_by_name('code_climate_improvement').destroy
      end
    end
  end
end
