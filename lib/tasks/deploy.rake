# Source: http://michaeldwan.com/writings/customize-your-heroku-deployment.html

namespace :deploy do

  desc 'Deploy to heroku'
  task :heroku do
    Rake::Task['deploy:before_deploy'].invoke
    Rake::Task['deploy:heroku_push'].invoke
    Rake::Task['deploy:after_deploy'].invoke
  end

  task :before_deploy do
    puts 'Running :before_deploy tasks...'
  end

  task :heroku_push do
    FileUtils.cd(Rails.root) do
      puts 'Pushing new code to Heroku...'
      raise 'Unable to push new code to Heroku' unless system('git push heroku master')
    end
  end

  task :after_deploy do
    puts 'Running :after_deploy tasks...'
    git_sha = `git rev-parse HEAD`.chomp
    raise 'Unable to set RELEASE_GIT_SHA config variable' unless system("bundle exec heroku config:set RELEASE_GIT_SHA=#{git_sha}")
    raise 'Unable to run schema and/or data migrations' unless system('bundle exec heroku run rake db:migrate db:data_migrate')
  end
end
