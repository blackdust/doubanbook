class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :information
      t.integer :total_price
      t.integer :phonenumber
      t.string :address
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
