class AddColumnToTalents < ActiveRecord::Migration
  def change
    add_column :talents, :talentType, :string
    remove_column :talents, :type, :string
  end
end
