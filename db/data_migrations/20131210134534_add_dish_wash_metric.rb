module DataMigration
  module MigrationFiles
    class AddDishWashMetric < Base

      def up
        Metric.create!(name: 'dish_wash', description: 'Dish Wash', default_unit: 10)
      end

      def down
        Metric.find_by_name('dish_wash').destroy
      end
    end
  end
end
