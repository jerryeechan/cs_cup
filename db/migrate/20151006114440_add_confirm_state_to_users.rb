class AddConfirmStateToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :confirm_state, :string, default: "pending"
  end
end
