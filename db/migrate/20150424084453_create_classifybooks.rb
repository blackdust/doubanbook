class CreateClassifybooks < ActiveRecord::Migration
  def change
    create_table :classifybooks do |t|
      t.string :condition
      t.string :user_id

      t.timestamps null: false
    end
  end
end
