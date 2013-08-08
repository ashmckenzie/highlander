module DataMigration
  module MigrationFiles
    class CullOffOldJenkinsGreenJobEvents < Base

      def up
        github_push = Metric.where(name: 'github_push').first
        jenkins_green_job = Metric.where(name: 'jenkins_green_job').first

        Event.where("created_at <= '2013-04-06' AND metric_id in (?)", [ github_push.id, jenkins_green_job.id ]).order('events.metric_id DESC').group_by(&:user_id).each do |user_id, events|
          grouped_events = events.group_by(&:metric_id)

          if grouped_events[jenkins_green_job.id].count / grouped_events[github_push.id].count > 4
            amount_to_delete = grouped_events[jenkins_green_job.id].count - grouped_events[github_push.id].count
            grouped_events[jenkins_green_job.id][0...amount_to_delete].each { |x| x.destroy }
          end
        end
      end

      def down
        # no down!
      end
    end
  end
end
