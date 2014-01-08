class MetricDecorator < Draper::Decorator

  alias :metric :source
  delegate_all

end
