class AddCaptianToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :captain, :string
  end
end
