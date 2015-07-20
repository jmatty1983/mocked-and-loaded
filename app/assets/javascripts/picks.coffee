@highlightSubString = (string, subString) ->
  reg = new RegExp(subString, 'gi')
  string.replace(reg, (str) ->
    "<span class='highlight-subString'>#{str}</span>"
  )

@setPick = ->
  $('#player-search').val($(this).text())
  $('.player-search-autocomplete').hide()
  $('#pick_player_id').val($(this).data('id'))

@buildPickForm = (index, player = null) ->
  playerId = $("pick-#{index}").data('player-id')
  player = null
  returnStr = null

  playerQuery = ->
    if playerId
      return $.ajax
        url: "players/#{playerId}",
        success: (data) ->
          player = data
        error: (data) ->
          player = null

  $.when(playerQuery).done ->
    value = "value='#{player.full_name} (#{player.pro_team} - #{player.position})'" if player
    returnStr = "<h1>Pick #{index}</h1>
    <input type='hidden' id='pick_player_id' value='#{playerId}'>
    <div class='player-search'>
    <label class='col-14'>Player</label>
    <div id='player-clear' class='col-2 right player-clear'>(remove)</div>
    <input type='text' id='player-search' placeholder='Empty' autocomplete='off' class='form-text' #{"value"}>
    <div class='player-search-autocomplete'>
    <ul id='player-search-ul'>
    </ul>
    </div>
    </div>
    <label class: 'col-16 no-clear'>Team</label>

    <div class='center-wrap'>
      <button class='btn btn-blue btn-md'>Save</button>
    </div>"

  return returnStr

#<%= f.select :team_id, pick.team.mock.teams.collect { |t| [t.name, t.id] }, {}, class: "form-text" %>

@setModalContent = (content, callBack) ->
  autoCompleteLast = null

  $('.modal-content').html content
  $('.modal-content').append '<a class="modal-close" href="#">x</a>'
  $('.modal-close').on 'click', ->
    $('.modal').fadeOut 'fast'
  callBack()