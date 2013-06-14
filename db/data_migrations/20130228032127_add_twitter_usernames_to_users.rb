module DataMigration
  module MigrationFiles
    class AddTwitterUsernamesToUsers < Base

      def up
        {
          'ash@hooroo.com' => 'ashmckenzie',
          'stuart@hooroo.com' => 'stuliston',
          'daniel@hooroo.com' => 'unroundme',
          'ashley@hooroo.com' => 'freakynamuh',
          'andrei@hooroo.com' => 'andreimiulescu',
          'chris@hooroo.com' => 'cirode',
          'gabe@hooroo.com' => 'gabrielrotbart',
          'james@hooroo.com' => '0x4a616d6573',
          'jamesd@hooroo.com' => 'jdunwoody',
          'kunal@hooroo.com' => 'techthumb',
          'michael@hooroo.com' => 'digital_face',
          'mike@hooroo.com' => 'Mike_Bain',
          'mikem@hooroo.com' => 'mikmortimer',
          'peter@hooroo.com' => 'petermoran',
          'phil@hooroo.com' => 'philmetcalfe',
          'sarah@hooroo.com' => 'SairrrB',
          'tim@hooroo.com' => 'supatimbo',
          'michelle@hooroo.com' => 'PolyCopy'

        }.each do |email, twitter_username|
          add_twitter_username_for(email, twitter_username)
        end
      end

      def down
        execute('UPDATE users set twitter_username = NULL')
      end

      private

      def add_twitter_username_for email, twitter_username
        user = User.with_email(email)
        UserService.create!(user: user, service: Services::Twitter.new(username: twitter_username))
      end
    end
  end
end
