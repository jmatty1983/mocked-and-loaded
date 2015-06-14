class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :mock_id
      t.integer :team_id
      t.integer :player_id
      t.integer :index

      t.timestamps null: false
    end
  end
end
