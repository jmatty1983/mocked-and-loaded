class AddUserTeamToMock < ActiveRecord::Migration
  def change
    add_column :mocks, :user_team, :integer
  end
end
