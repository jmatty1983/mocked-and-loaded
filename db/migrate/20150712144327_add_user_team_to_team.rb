class AddUserTeamToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :user_team, :boolean
  end
end
