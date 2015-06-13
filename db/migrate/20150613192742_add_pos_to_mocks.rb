class AddPosToMocks < ActiveRecord::Migration
  def change
    add_column :mocks, :qb, :integer
    add_column :mocks, :rb, :integer
    add_column :mocks, :wr, :integer
    add_column :mocks, :te, :integer
    add_column :mocks, :rbwr, :integer
    add_column :mocks, :rbwrte, :integer
    add_column :mocks, :qbrbwrte, :integer
    add_column :mocks, :k, :integer
    add_column :mocks, :dst, :integer
  end
end
