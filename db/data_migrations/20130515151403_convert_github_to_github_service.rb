module DataMigration
  module MigrationFiles
    class ConvertGithubToGithubService < Base

      def up
        {
          github_username: 'ashmckenzie', slug: 'ash-mckenzie',
          github_username: 'stuliston', slug: 'stu-liston',
          github_username: 'clouseauu', slug: 'dan-bradford',
          github_username: 'Freaky-namuH', slug: 'ashley-cambrell',
          github_username: 'andrei-miulescu', slug: 'andrei-miulescu',
          github_username: 'cirode', slug: 'chris-rode',
          github_username: 'gabrielrotbart', slug: 'gabriel-rotbart',
          github_username: 'jmartelletti', slug: 'james-martelletti',
          github_username: 'jdunwoody', slug: 'james-dunwoody',
          github_username: 'mkrz09', slug: 'michael-krzanich',
          github_username: 'TheAlphaTester', slug: 'mike-bain',
          github_username: 'mikemortimer', slug: 'mike-mortimer',
          github_username: 'pmoran', slug: 'peter-moran',
          github_username: 'philmetcalfe', slug: 'phil-metcalfe',
          github_username: 'sarahblayden', slug: 'sarah-blayden',
          github_username: 'timothydang', slug: 'timothy-dang',
        }.each do |github_username, slug|
          if user = User.find(slug)
            github_service = Services::Github.new(username: github_username, emails: user.emails)
            user.user_services << UserService.new(service: github_service)
          end
        end
      end

      def down
        Services::Twitter.destroy_all
      end
    end
  end
end
