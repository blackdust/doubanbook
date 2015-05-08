class AddQualityIntoCart < ActiveRecord::Migration
  def change
    add_column(:carts, :quality, :integer,)
  end
end
