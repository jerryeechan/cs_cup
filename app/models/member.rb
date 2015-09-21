class Member < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image, ImageUploader
	mount_uploader :studentidcardfront, ImageUploader
	mount_uploader :studentidcardback, ImageUploader
	mount_uploader :idcardfront, ImageUploader
	mount_uploader :idcardback, ImageUploader

end
