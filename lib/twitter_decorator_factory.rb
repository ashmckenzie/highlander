class TwitterDecoratorFactory

  def self.setup_for twitter_service
    if twitter_service
      TwitterDecorator.new(twitter_service)
    else
      NullTwitterDecorator.new
    end
  end
end
