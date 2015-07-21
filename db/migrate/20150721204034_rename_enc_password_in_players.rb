class RenameEncPasswordInPlayers < ActiveRecord::Migration
  def change
    rename_column :players, :enc_password, :password_digest
  end
end
