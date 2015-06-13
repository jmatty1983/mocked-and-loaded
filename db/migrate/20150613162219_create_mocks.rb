class CreateMocks < ActiveRecord::Migration
  def change
    create_table :mocks do |t|
      t.string :name
      t.integer :team_count

      t.timestamps null: false
    end
  end
end
