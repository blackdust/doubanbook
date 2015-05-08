class AddPasswordDigestTousers < ActiveRecord::Migration
  def change
     
    add_column :users, :password_digest, :strings
  end
  
end
