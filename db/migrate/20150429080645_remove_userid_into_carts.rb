class RemoveUseridIntoCarts < ActiveRecord::Migration
  def change
    remove_column(:carts,:userid,:integer)
  end
end
