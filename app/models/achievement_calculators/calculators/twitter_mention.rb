module AchievementCalculators
  module Calculators
    class TwitterMention < Event

      event_calculator!

      private

      def badges
        {
          1   => '1_twitter_mention',
          25  => '25_twitter_mentions',
          50  => '50_twitter_mentions'
        }
      end
    end

  end

end
