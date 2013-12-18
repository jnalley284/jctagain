class AddProjectToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :project_id,:integer 
  end
end
