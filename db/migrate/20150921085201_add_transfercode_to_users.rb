class AddTransfercodeToUsers < ActiveRecord::Migration
  def change
  		add_column :users, :transfercode, :string
  		add_column :users, :success ,:boolean

  end
end
