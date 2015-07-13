@doPicks = ->
  $('.mock-tracker-item').each ->
    return false unless $(this).data('player-id')
    console.log $(this).data('player-id')
    #Have to come up with a way to keep track of each team
    #maybe some hidden content

    #put some pick logic here

    #
ready = ->

$(document).ready(ready)
$(document).on('page:load', ready)