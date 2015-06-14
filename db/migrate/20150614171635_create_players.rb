class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :pro_status
      t.integer :cbs_id
      t.string :pro_team
      t.integer :bye_week
      t.string :photo_url
      t.string :position

      t.timestamps null: false
    end
  end
end
