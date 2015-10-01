class AddRegisterSuccessToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :is_register_confirmed, :boolean
  end
end
