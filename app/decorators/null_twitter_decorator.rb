NullTwitterDecorator = Naught.build do |config|
  config.mimic TwitterDecorator

  def setup?
    false
  end
end
