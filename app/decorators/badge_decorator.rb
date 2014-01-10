class BadgeDecorator < Draper::Decorator

  alias :badge :source
  delegate_all

  include ActionView::Helpers::AssetUrlHelper

  def image_path
    asset_path("assets/badges/#{name}.png")
  end

  def image_url
    asset_url("badges/#{name}.png")
  end

end
