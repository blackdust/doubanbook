class AddUseridIntoCarts < ActiveRecord::Migration
  def change
    add_column(:carts, :userid, :integer)
  end
end
