Stethoscope.check :release do |response|
  response['release_git_sha'] = ENV['RELEASE_GIT_SHA'] || 'HEAD'
end

Stethoscope.check :schema_migrations do |response|
  query = 'SELECT version FROM schema_migrations order by version ASC'
  result = ActiveRecord::Base.connection.execute(query)
  response['all'] = result.map { |x| x['version'] }
end

Stethoscope.check :data_migrations do |response|
  query = 'SELECT version FROM data_migrations order by version ASC'
  result = ActiveRecord::Base.connection.execute(query)
  response['all'] = result.map { |x| x['version'] }
end

Stethoscope.check :events do |response|
  response['most_recent'] = Event.order('events.created_at DESC').limit(10).map do |e|
    {
      id: e.id,
      user_name: e.user.name,
      metric_name: e.metric.name,
      value: e.value,
      created_at: e.created_at
    }
  end
end

Stethoscope.check :achievements do |response|
  response['most_recent'] = Achievement.order('achievements.created_at DESC').limit(10).map do |a|
    {
      id: a.id,
      user_name: a.user.name,
      badge_name: a.badge.name,
      description: a.description.blank? ? a.badge.description : a.description,
      tag: a.tag.blank? ? a.badge.tag : a.tag,
      created_at: a.created_at
    }
  end
end
