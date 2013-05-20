module Enabler
  extend ActiveSupport::Concern

  def enable!
    update(enabled: true)
  end

  def disable!
    update(enabled: false)
  end
end
