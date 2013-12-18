class AddFlexIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :flex_id, :integer
  end
end
