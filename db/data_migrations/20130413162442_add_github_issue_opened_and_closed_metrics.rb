module DataMigration
  module MigrationFiles
    class AddGithubIssueOpenedAndClosedMetrics < Base

      def up
        # kill the old one - I need a distinct endpoint for opened and closed ~SL
        Metric.find_by_name('github_issue').destroy
        Metric.create!(name: 'github_issue_opened', description: 'Opened GitHub issue', default_unit: 5)
        Metric.create!(name: 'github_issue_closed', description: 'Closed GitHub issue', default_unit: 5)
      end

      def down
        Metric.create!(name: 'github_issue', description: 'GitHub issue')
        Metric.find_by_name('github_issue_opened').destroy
        Metric.find_by_name('github_issue_closed').destroy
      end
    end
  end
end
