module DataMigration
  module MigrationFiles
    class MoarPtsForGithubIssueClose < Base

      def up
        execute("update metrics set default_unit = 10 where name = 'github_issue_closed'")
      end

      def down
        execute("update metrics set default_unit = 5 where name = 'github_issue_closed'")
      end
    end
  end
end
