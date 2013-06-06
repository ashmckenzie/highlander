module DataMigration
  module MigrationFiles
    class AddGituhbUsernames < Base

      def up
        execute "update users set github_username = 'ashmckenzie' where slug = 'ash-mckenzie'"
        execute "update users set github_username = 'stuliston' where slug = 'stu-liston'"
        execute "update users set github_username = 'clouseauu' where slug = 'dan-bradford'"
        execute "update users set github_username = 'Freaky-namuH' where slug = 'ashley-cambrell'"
        execute "update users set github_username = 'andrei-miulescu' where slug = 'andrei-miulescu'"
        execute "update users set github_username = 'cirode' where slug = 'chris-rode'"
        execute "update users set github_username = 'gabrielrotbart' where slug = 'gabriel-rotbart'"
        execute "update users set github_username = 'jmartelletti' where slug = 'james-martelletti'"
        execute "update users set github_username = 'jdunwoody' where slug = 'james-dunwoody'"
        execute "update users set github_username = 'mkrz09' where slug = 'michael-krzanich'"
        execute "update users set github_username = 'TheAlphaTester' where slug = 'mike-bain'"
        execute "update users set github_username = 'mikemortimer' where slug = 'mike-mortimer'"
        execute "update users set github_username = 'pmoran' where slug = 'peter-moran'"
        execute "update users set github_username = 'philmetcalfe' where slug = 'phil-metcalfe'"
        execute "update users set github_username = 'sarahblayden' where slug = 'sarah-blayden'"
        execute "update users set github_username = 'timothydang' where slug = 'timothy-dang'"
      end

      def down
      end
    end
  end
end
