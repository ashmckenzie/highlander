module AchievementCalculators
  module Calculators

    class CodeQualityImprovement < Event

      event_calculator!

      private

      def badges
        {
          1   => '1_code_quality_improvement',
          10  => '10_code_quality_improvements',
          25  => '25_code_quality_improvements',
          50  => '50_code_quality_improvements',
          100 => '100_code_quality_improvements'
        }
      end

    end

  end
end
