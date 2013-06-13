Stethoscope.check :events, :critical do |response|
  query = 'SELECT created_at FROM events order by created_at DESC LIMIT 1'
  result = ActiveRecord::Base.connection.execute(query)
  response['query'] = query.inspect
  response['most_recent'] = Time.zone.parse(result.first['created_at'])
end
