class AddImageToMembers < ActiveRecord::Migration
  def change
    add_column :members, :image, :string

    add_column :members, :studentidcardfront, :string
    add_column :members, :studentidcardback, :string
    add_column :members, :idcardfront, :string
    add_column :members, :idcardback, :string
    
  end
end
