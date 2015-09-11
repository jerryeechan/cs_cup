class UserTalentJoinTable < ActiveRecord::Migration
  def change
  	create_table	:users_talents,:id => false do|t|
  		t.belongs_to :user, index: true
  		t.belongs_to :talent, index:true
  	end  	
  end	
end
