class PayloadAdapterFactory

  def self.for(payload)
    "PayloadAdapters::#{payload[:metric].camelize}".constantize.new
  rescue NameError
    PayloadAdapters::Basic.new
  end

end