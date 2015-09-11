class AddPostsToUsers < ActiveRecord::Migration
  def change
    add_reference :posts, :user, index: true
    add_reference :talents, :user, index: true
  end
end
