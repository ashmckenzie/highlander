class MetricDecorator < Draper::Decorator

  alias :metric :source
  delegate_all

  def image_url
    'FIX ME'
  end

  def serialised
    {
      id: metric.id,
      name: metric.name,
      name: metric.name,
      description: metric.description,
      image_url: image_url
    }
  end

end
