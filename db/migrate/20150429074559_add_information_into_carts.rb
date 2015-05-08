class AddInformationIntoCarts < ActiveRecord::Migration
  def change
    add_column(:carts, :price, :integer)
  end
  def change
    add_column(:carts, :auther, :string)
  end
  def change
    add_column(:carts, :title, :string)
  end
end
