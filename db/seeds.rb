raise 'Only for development yo!' if ENV['RAILS_ENV'] == 'production'

User.all.each do |user|
  Metric.all.each do |metric|
    count = rand(50)+1
    message = "Creating #{count} #{metric.name} events for #{user.name}"
    puts message
    Rails.logger.info message
    1.upto(count).each do
      user.events << Event.new(metric: metric)
    end
  end
end
