class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :project_id
      t.string :flex_project_code
      t.string :status_code
      t.string :message

      t.timestamps
    end
  end
end
