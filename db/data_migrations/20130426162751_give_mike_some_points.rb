module DataMigration
  module MigrationFiles
    class GiveMikeSomePoints < Base

      def up
        metric = Metric.create!(name: 'mike_bain', description: 'Mike Bain', default_unit: 1000000)
        Event.create(metric: metric, user: User.find_by_name('Mike Bain'), value: 1000000)
      end

      def down
      end
    end
  end
end
