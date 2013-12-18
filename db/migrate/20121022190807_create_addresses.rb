class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :point_of_contact
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone_number
      t.references :user

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
