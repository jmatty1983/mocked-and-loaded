players = ActiveSupport::JSON.decode(File.read('db/player_data.json'))

Player.transaction do
  players.each_with_index do |player, i|
    puts "Adding Players #{i}-#{i + 100}" if i % 100 == 0
    Player.create(first_name: player["firstname"],  last_name:  player["lastname"],
                  pro_status: player["pro_status"], cbs_id:     player["id"],
                  pro_team:   player["pro_team"],   bye_week:   player["bye_week"],
                  photo_url:  player["photo"],      position:   player["position"],
                  full_name:  player["fullname"]) unless player["firstname"].empty?
  end
end