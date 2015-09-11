class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy,:as =>:commentable
	validates :title, presence: true #, length: {minimum: 5}
	validates :body,  presence: true
	belongs_to :user
end
