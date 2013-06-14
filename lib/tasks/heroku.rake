namespace :heroku do

  desc 'Deploy to heroku'
  task :deploy do
    command = 'bundle exec thor heroku:deploy heroku master thequickening'
    $stderr.puts "!! This task will be deprecated soon.  Please use the thor task -> bundle exec thor heroku:deploy heroku master thequickening\n\n"
    system(command)
  end
end
