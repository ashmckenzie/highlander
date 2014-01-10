module ApplicationHelper

  def unclaimed_bounties_text
    "Bounties ".html_safe <<
    ((unclaimed_bounties > 0) ? content_tag(:span, unclaimed_bounties, class: 'count') : nil)
  end

  def organisation_url org
    "http://#{org}.#{request.env['HTTP_HOST'].gsub(/www\./, '')}"
  end
end
