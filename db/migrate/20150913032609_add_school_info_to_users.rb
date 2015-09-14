class AddSchoolInfoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :school, :string
  	add_column :users, :department, :string
  	add_column :users, :sport, :string
  end
end
