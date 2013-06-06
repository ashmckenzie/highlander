module AchievementCalculators
  module Calculators
    class JenkinsGreenJob < Event

      event_calculator!

      private

      def badges
        {
          1    => '1_jenkins_green_job',
          100  => '100_jenkins_green_jobs',
          250  => '250_jenkins_green_jobs',
          500  => '500_jenkins_green_jobs',
          1000 => '1000_jenkins_green_jobs'
        }
      end
    end

  end

end
