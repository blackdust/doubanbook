class RenameNationIntoImageFrom < ActiveRecord::Migration
  def change
     rename_column(:products, :nation, :image)
  end
end
