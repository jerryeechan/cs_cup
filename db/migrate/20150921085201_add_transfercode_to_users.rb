class AddTransfercodeToUsers < ActiveRecord::Migration
  def change
  		add_column :users, :transfercode, :string
  end
end
