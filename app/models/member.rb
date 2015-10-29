class Member < ActiveRecord::Base
	default_scope { order(updated_at: :desc) }
	scope :filter_name, ->(name){
      where "name like ?", "#{name}%"
    }

	def self.filter(filtering_params)
      results = self.all
      puts results
      
      filtering_params.each do |key, value|
        results = results.public_send(key, value)
      end
      results
    end

	belongs_to :user
	mount_uploader :image, ImageUploader
	mount_uploader :studentidcardfront, ImageUploader
	mount_uploader :studentidcardback, ImageUploader
	mount_uploader :idcardfront, ImageUploader
	mount_uploader :idcardback, ImageUploader

end
