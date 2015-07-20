class AddIndexToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :index, :integer
  end
end
