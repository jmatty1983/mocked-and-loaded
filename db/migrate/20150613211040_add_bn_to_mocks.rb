class AddBnToMocks < ActiveRecord::Migration
  def change
    add_column :mocks, :bn, :integer
  end
end
