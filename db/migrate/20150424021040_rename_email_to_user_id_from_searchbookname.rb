class RenameEmailToUserIdFromSearchbookname < ActiveRecord::Migration
  def change
    rename_column(:serchbooknames, :email, :user_id)
  end
end
