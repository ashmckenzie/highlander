class PayloadAdapterFactory

  def self.for(metric)
    "PayloadAdapters::#{metric.camelize}".constantize.new
  rescue NameError
    PayloadAdapters::Basic.new
  end

end