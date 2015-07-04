class RemoveMockIdFromPicks < ActiveRecord::Migration
  def change
    remove_column :picks, :mock_id, :integer
  end
end
