@mockFormHooks = ->
  $('#mock_team_count').change ->
    mockUserTeam = $('#mock_user_team')
    mockTeamNames = $('#team_names')

    mockUserTeam.find('option').remove()
    nameArray = []
    mockTeamNames.find('input').each ->
      nameArray.push $(this).val()
      $(this).remove()

    theEnd = $('#mock_team_count').val()
    for i in [0..theEnd - 1]
      if nameArray[i]
        val = nameArray[i]
      else
        val = "Team #{i + 1}"
      mockUserTeam.append("<option value='#{i}'>#{val}</option>")
      mockTeamNames.append("<input type='hidden' value=\"#{val}\" name='mock[teams_attributes][#{i}][name]'
                         id='mock_teams_attributes_#{i}_name'>")