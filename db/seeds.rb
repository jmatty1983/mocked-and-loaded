players = ActiveSupport::JSON.decode(File.read('db/player_data.json'))

playersAdp = {}
File.open('db/adp.dat').each_line do |line|
  lineArray = line.split
  playerName = "#{lineArray[1]} #{lineArray[2]}".downcase
  yahooAdp = lineArray[6]
  espnAdp = lineArray[7]
  cbsAdp = lineArray[8]
  playersAdp[playerName] = {yahooAdp: yahooAdp.to_i, espnAdp: espnAdp.to_i, cbsAdp: cbsAdp.to_i}
end


Player.transaction do
  validArr = ['QB', 'RB', 'WR', 'TE', 'K']

  players.each_with_index do |player, i|
    if playersAdp["#{player["firstname"]} #{player["lastname"]}".downcase]
      adpHash = playersAdp["#{player["firstname"]} #{player["lastname"]}".downcase]
      Player.create(first_name: player["firstname"],  last_name:  player["lastname"],
                    pro_status: player["pro_status"], cbs_id:     player["id"],
                    pro_team:   player["pro_team"],   bye_week:   player["bye_week"],
                    photo_url:  player["photo"],      position:   player["position"],
                    full_name:  player["fullname"],   yahoo_adp:  adpHash[:yahooAdp],
                    espn_adp:   adpHash[:espnAdp],   cbs_adp:     adpHash[:cbsAdp]) if !player["firstname"].empty? and
                    validArr.include?(player['position'])
    end
  end
  puts "#{Player.count} players added."
end