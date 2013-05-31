module DataMigration
  module MigrationFiles
    class AddBountyBadge < Base

      def up
        Badge.create!(name: 'bounty_claimed', tag: "I've come for my reward..", description: 'Bounty claimed')
      end

      def down
        Badge.find_by_name('bounty_claimed').destroy
      end
    end
  end
end
