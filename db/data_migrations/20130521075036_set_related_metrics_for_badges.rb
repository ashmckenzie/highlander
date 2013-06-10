module DataMigration
  module MigrationFiles
    class SetRelatedMetricsForBadges < Base

      def up
        {
          'github_push' => '%_github_push%',
          'github_issue_opened' => '%_github_issue%_opened',
          'github_issue_closed' => '%_github_issue%_closed',
          'jenkins_green_job' => '%_jenkins_green_job%',
          'ming_pong_victory' => '%_ming_pong_victor%',
          'ming_pong_loss' => '%_ming_pong_loss%',
          'twitter_mention' => '%_twitter_mention%',
          'pager_duty_ack' => '%_pager_duty_ack%'

        }.each do |metric, match|
          Badge.where("name LIKE ?", match).update_all(related_metric: metric)
        end
      end

      def down
        execute('UPDATE badges set related_metric = NULL')
      end
    end
  end
end
