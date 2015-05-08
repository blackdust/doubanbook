class CreateSerchbooknames < ActiveRecord::Migration
  def change
    create_table :serchbooknames do |t|
      t.string :word
      t.string :email

      t.timestamps null: false
    end
  end
end
