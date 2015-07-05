@mockFormHooks = ->
  $('#mock_team_count').change ->
    mockUserTeam = $('#mock_user_team')
    mockTeamNames = $('#team_names')

    mockUserTeam.find('option').remove()
    mockTeamNames.find('input').remove()
    theEnd = $('#mock_team_count').val()
    for i in [1..theEnd]
      mockUserTeam.append("<option value='#{i}'>#{i}</option>")
      mockTeamNames.append("<input type='hidden' value='Team #{i}' name='mock[teams_attributes][#{i}][name]'
                         id='mock_teams_attributes_#{i}_name'>")