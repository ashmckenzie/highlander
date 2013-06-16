module ApplicationHelper

  def badge_image_url badge
    asset_path("badges/#{badge.name}.png") if badge
  end

  def unclaimed_bounties_text
    content_tag(:span, 'Bounties ') <<
    ((unclaimed_bounties > 0) ? content_tag(:span, unclaimed_bounties, class: 'count') : nil)
  end
end
