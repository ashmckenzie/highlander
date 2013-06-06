module AchievementCalculators
  module Calculators
    class PagerDutyAck < Event

      event_calculator!

      private

      def badges
        {
          1    => '1_pager_duty_ack',
          100  => '100_pager_duty_acks',
          250  => '250_pager_duty_acks',
          500  => '500_pager_duty_acks'
        }
      end
    end

  end

end
