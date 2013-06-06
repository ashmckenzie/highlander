module Enabler
  extend ActiveSupport::Concern

  included do
    scope :enabled, -> { where(enabled: true) }
  end

  def enable!
    update(enabled: true)
  end

  def disable!
    update(enabled: false)
  end
end
