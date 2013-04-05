$(document).ready ->

  $badges = $('img[data-badge]')
  $badgeDetails = $('.badge-details')

  $badgeDetails.each ->
    $(this).appendTo('#badge-descriptions').hide()

  $badges.hover ->
    $("div[data-badge=#{$(this).attr('data-badge')}]").show()
  , ->
    $("div[data-badge=#{$(this).attr('data-badge')}]").hide()