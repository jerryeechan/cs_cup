class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
  	#remove_index :users, :reset_password_token
   # remove_column :users, :encrypted_password, :string
   # remove_column :users, :reset_password_token, :string
   # remove_column :users, :reset_password_sent_at, :string

  end
end
