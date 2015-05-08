class AlterPhonenumberIntoOrders < ActiveRecord::Migration
  def change
    change_column(:orders, :phonenumber, :string)
  end
end
