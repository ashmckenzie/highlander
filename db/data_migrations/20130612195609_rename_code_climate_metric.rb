module DataMigration
  module MigrationFiles
    class RenameCodeClimateMetric < Base

      def up
        execute "update metrics set name = 'code_quality_improvement', description = 'Code Quality Improvement' where name = 'code_climate_improvement';"
      end

      def down
        execute "update metrics set name = 'code_climate_improvement', description = 'Code Climate Improvement' where name = 'code_quality_improvement';"
      end

    end
  end
end
