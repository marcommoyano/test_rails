class ChangeUserColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :password_digest, :password
    add_column :users, :email, :string
  end
end
