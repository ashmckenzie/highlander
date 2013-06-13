raise 'Only for development yo!' if ENV['RAILS_ENV'] == 'production'

User.all.each do |user|
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

(1..20).each do |count|
  bounties = ["Han", "Chewbacca", "Luke", "Lando", "Dan"]
  user = User.all.sample
  bounty_name = bounties.sample
  created_at = Time.zone.now - (rand(21)+1).days

  bounty_params = { name:          "#{bounty_name} hunt #{user.name} (#{count})",
                    description:   "Hunt down #{bounty_name}, #{user.name} (#{count})",
                    created_by_id: user.id,
                    created_at:    created_at}

  if rand(2) > 0
    puts "Creating unclaimed bounty on #{bounty_name} for #{user.name} (#{count})"
    Bounty.new(bounty_params).save
  else
    puts "Creating claimed bounty on #{bounty_name} for #{user.name} (#{count})"
    claimed_params = bounty_params.merge(claimed_by_id: User.where("slug != ?", user.slug).sample.id, claimed_at: (created_at + 5.days))
    Bounty.new(claimed_params).save
  end

end
