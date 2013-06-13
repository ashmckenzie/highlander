# Source: http://michaeldwan.com/writings/customize-your-heroku-deployment.html
# Helpful: https://github.com/sstephenson/rbenv/issues/400#issuecomment-18744931

namespace :deploy do

  desc 'Deploy to heroku'
  task :heroku do
    Rake::Task['deploy:before_deploy'].invoke
    Rake::Task['deploy:heroku_push'].invoke
    Rake::Task['deploy:after_deploy'].invoke
  end

  task :before_deploy do
    puts '> Running :before_deploy tasks...'
  end

  task :heroku_push do
    FileUtils.cd(Rails.root) do
      puts '> Pushing new code to Heroku...'
      raise 'Unable to push new code to Heroku' unless system('git push heroku master')
    end
  end

  task :after_deploy do
    puts '> Running :after_deploy tasks...'
    git_sha = `git rev-parse HEAD`.chomp
    raise 'Unable to set RELEASE_GIT_SHA config variable' unless Bundler.with_clean_env { system("heroku config:set RELEASE_GIT_SHA=#{git_sha}") }
    raise 'Unable to run schema and/or data migrations' unless Bundler.with_clean_env { system('heroku run rake db:migrate db:data_migrate') }
  end
end
