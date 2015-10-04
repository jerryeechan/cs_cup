class AddInsuranseToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :has_insurance,:boolean, default: true
  end
end
