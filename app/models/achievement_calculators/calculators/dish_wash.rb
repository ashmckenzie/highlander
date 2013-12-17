module AchievementCalculators
  module Calculators
    class DishWash < Event

      event_calculator!

      private

      def badges
        {
          1     => '1_dish_wash',
          20    => '20_dish_washes',
          50    => '50_dish_washes',
          100   => '100_dish_washes',
          500   => '500_dish_washes'
        }
      end
    end

  end

end
