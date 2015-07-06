@highlightSubString = (string, subString) ->
  reg = new RegExp(subString, 'gi')
  string.replace(reg, (str) ->
    "<span class='highlight-subString'>#{str}</span>"
  )

@setPick = ->
  $('#player-search').val($(this).text())
  $('.player-search-autocomplete').hide()
  $('#pick_player_id').val($(this).data('id'))

@setModalContent = (content, callBack) ->
  autoCompleteLast = null

  $('.modal-content').html content
  $('.modal-content').append '<a class="modal-close" href="#">x</a>'
  $('.modal-close').on 'click', ->
    $('.modal').fadeOut 'fast'
  callBack()