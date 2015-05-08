class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :subject
      t.string :nation

      t.timestamps null: false
    end
  end
end
