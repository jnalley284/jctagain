class AddCardTokenToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :card_token, :string
  end
end
