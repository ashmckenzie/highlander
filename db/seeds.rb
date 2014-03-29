raise 'Only for development yo!' if ENV['RAILS_ENV'] == 'production'

User.point_earner.each do |user|
  Metric.all.shuffle.take(3).each do |metric|
    count = rand(50)+1

    message = "Creating #{count} #{metric.name} events for #{user.name}"
    puts message
    Rails.logger.info message

    1.upto(count).each do
      created_at = Time.zone.now - (rand(21)+1).days
      user.events << Event.new(metric: metric, created_at: created_at)
    end
  end
end
