class AddFlexProjectIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :flex_project_id, :string
  end
end
