class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :stripe_customer_token
      t.references :project

      t.timestamps
    end
    add_index :payments, :project_id
  end
end
