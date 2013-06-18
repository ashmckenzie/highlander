class TwitterDecoratorFactory

  def self.setup_for twitter_service
    if twitter_service
      TwitterDecorator.new(twitter_service)
    else
      TwitterNullDecorator.new
    end
  end
end
