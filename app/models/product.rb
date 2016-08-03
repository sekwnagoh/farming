class Product < ActiveRecord::Base 
	has_many :product_options

	enum category: { pear: 1, rice: 2, pear_rice: 3 }

	mount_uploader :picture, PictureUploader

end
