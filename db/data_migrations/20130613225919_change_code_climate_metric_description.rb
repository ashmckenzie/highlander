module DataMigration
  module MigrationFiles
    class ChangeCodeClimateMetricDescription < Base

      def up
        execute "update metrics set description = 'Code Improvement' where name = 'code_quality_improvement';"
      end

      def down
        execute "update metrics set description = 'Code Quality Improvement' where name = 'code_quality_improvement';"
      end
    end
  end
end
