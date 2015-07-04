highlightSubString = (string, subString) ->
  reg = new RegExp(subString, 'gi')
  string.replace(reg, (str) ->
    "<span class='highlight-subString'>#{str}</span>"
  )

setPick = ->
  $('#player-search').val($(this).text())
  $('.player-search-autocomplete').hide()
  $('#pick_player_id').val($(this).data('id'))

@setModalContent = (content) ->
  autoCompleteLast = null

  $('.modal-content').html content
  $('.modal-content').append '<a class="modal-close" href="#">x</a>'
  $('.modal-close').on 'click', ->
    $('.modal').fadeOut 'fast'
  $('#player-search').keyup (e) ->
    clearTimeout autoCompleteLast
    autoCompleteLast = setTimeout ->
      searchStr = $('#player-search').val()
      if searchStr
        $.ajax({
          type: "POST",
          url: "/players/search",
          data: { string: searchStr },
          success: (data) ->
            if data['players'].length > 0
              playerSearchUl = $('#player-search-ul')
              playerSearchUl.html('')
              for d in data['players']
                playerStr = "#{highlightSubString(d.full_name, data['searchStr'])}"
                playerStr = "#{playerStr} (#{d.pro_team} - #{d.position})"
                playerSearchUl.append "<li class='player-picker-item' data-id='#{d.id}'>#{playerStr}</li>"
              $('.player-search-autocomplete').show()
              $('.player-picker-item').click setPick

            else
              $('.player-search-autocomplete').hide()
            return false
          error: (data) ->
            return false
        })
      else
        $('.player-search-autocomplete').hide()
    , 1000

