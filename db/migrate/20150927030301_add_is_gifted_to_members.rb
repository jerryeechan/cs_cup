class AddIsGiftedToMembers < ActiveRecord::Migration
  def change
  	add_column :members, :isGifted, :boolean
  end
end
