class RenamePassword2ToPasswordConfirmation < ActiveRecord::Migration
  def change
    rename_column(:users, :password2, :password_confirmation)
  end
end
