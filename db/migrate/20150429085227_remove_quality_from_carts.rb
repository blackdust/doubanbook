class RemoveQualityFromCarts < ActiveRecord::Migration
  def change
    remove_column(:carts, :quality, :intager)
  end
end
