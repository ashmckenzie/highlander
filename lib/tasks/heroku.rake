# Source: http://michaeldwan.com/writings/customize-your-heroku-deployment.html
# Helpful: https://github.com/sstephenson/rbenv/issues/400#issuecomment-18744931

namespace :heroku do

  namespace :deploy do

    task :deploy do
      Rake::Task['heroku:deploy:before_deploy'].invoke
      Rake::Task['heroku:deploy:heroku_push'].invoke
      Rake::Task['heroku:deploy:after_deploy'].invoke
    end

    task :before_deploy do
      puts '> Running :before_deploy tasks...'
      puts
    end

    task :heroku_push do
      FileUtils.cd(Rails.root) do
        puts '> Pushing new code to Heroku...'
        raise 'Unable to push new code to Heroku' unless system('git push heroku master')
      end
      puts
    end

    task :after_deploy do
      puts '> Running :after_deploy tasks...'
      Rake::Task['heroku:deploy:update_release_git_sha'].invoke
      Rake::Task['heroku:deploy:schema_and_data_migrations'].invoke
    end

    #--------------------------------------------------------------------------#

    task :update_release_git_sha do
      puts '>> Updating the RELEASE_GIT_SHA config variable to the latest git SHA...'
      git_sha = `git rev-parse HEAD`.chomp
      raise 'Unable to set RELEASE_GIT_SHA config variable' unless Bundler.with_clean_env { system("heroku config:set RELEASE_GIT_SHA=#{git_sha}") }
      puts
    end

    task :schema_and_data_migrations do
      puts '>> Running schema/data migrations...'
      raise 'Unable to run schema and/or data migrations' unless Bundler.with_clean_env { system('heroku run rake db:migrate db:data_migrate') }
      puts
    end
  end

  desc 'Deploy to heroku'
  task :deploy do
    Rake::Task['heroku:deploy:deploy'].invoke
  end
end
