$(document).ready ->

  activityUl = $('#activity ul')

  eventTemplateSource = $('#event-template').html()
  eventTemplate = Handlebars.compile(eventTemplateSource)

  $.get '/activity/current.json', (activity) ->
    _.each activity, (item) ->
      content = eventTemplate(item)
      activityUl.prepend(content)

  source = new EventSource('/activity/stream')

  source.addEventListener "hilander:activity-feed:events", ((e) ->
    eventsInDom = activityUl.find('li')

    if eventsInDom.length >= 100
      eventsInDom.last().remove()

    content = eventTemplate(JSON.parse(e.data))

    activityUl.prepend(content)
  ), false
