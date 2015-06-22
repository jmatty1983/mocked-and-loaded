@setModalContent = (content) ->
  $('.modal-content').html content
  $('.modal-content').append '<a class="modal-close" href="#">x</a>'
  $('.modal-close').on 'click', ->
    $('.modal').fadeOut 'fast'
    
ready = ->

$(document).ready(ready)
$(document).on('page:load', ready)