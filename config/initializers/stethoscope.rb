Stethoscope.check :events, :critical do |response|
  response['most_recent'] = Event.last.created_at
end
