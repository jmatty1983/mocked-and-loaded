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
          success:(data) ->
            if data.length > 0
              playerSearchUl = $('#player-search-ul')
              playerSearchUl.html('')
              for d in data
                playerSearchUl.append "<li>#{d.full_name}</li>"
              $('.player-search-autocomplete').show()
            else
              $('.player-search-autocomplete').hide()
            return false
          error:(data) ->
            return false
        })
      else
        $('.player-search-autocomplete').hide()
    , 1000

