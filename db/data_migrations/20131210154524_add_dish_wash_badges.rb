module DataMigration
  module MigrationFiles
    class AddDishWashBadges < Base

      def up
        Badge.create!(name: '1_dish_wash', tag: 'Rookie Washer', description: 'First Dish Wash')
        Badge.create!(name: '20_dish_washes', tag: "DuoDecaWasher", description: '10 Dish Washes')
        Badge.create!(name: '50_dish_washes', tag: "Keepin' it clean", description: '50 Dish Washes')
        Badge.create!(name: '100_dish_washes', tag: "Mr. Clean got nuttin' on you", description: '100 Dish Washes')
        Badge.create!(name: '500_dish_washes', tag: "Washing at an industrial scale", description: '500 Dish Washes!')
      end

      def down
        Badge.find_by_name('1_dish_wash').destroy
        Badge.find_by_name('20_dish_washes').destroy
        Badge.find_by_name('50_dish_washes').destroy
        Badge.find_by_name('100_dish_washes').destroy
        Badge.find_by_name('500_dish_washes').destroy
      end
    end
  end
end
