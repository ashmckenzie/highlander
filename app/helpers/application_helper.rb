module ApplicationHelper

  def badge_image_url badge
    asset_path("badges/#{badge.name}.png")
  end
end
