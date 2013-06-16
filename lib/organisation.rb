class Organisation

  include Singleton

  attr_accessor :name

  def set?
    !name.blank?
  end
end
