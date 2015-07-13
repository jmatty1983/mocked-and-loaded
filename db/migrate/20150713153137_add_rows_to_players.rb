class AddRowsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :espn_adp, :integer
    add_column :players, :yahoo_adp, :integer
    add_column :players, :cbs_adp, :integer
  end
end
