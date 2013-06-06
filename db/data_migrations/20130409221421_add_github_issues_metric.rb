module DataMigration
  module MigrationFiles
    class AddGithubIssuesMetric < Base

      def up
        Metric.create!(name: 'github_issue', description: 'GitHub issue')
      end

      def down
        Metric.find_by_name('github_issue').destroy
      end
    end
  end
end
