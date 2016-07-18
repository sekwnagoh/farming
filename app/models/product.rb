class Product < ActiveRecord::Base
	mount_uploader :picture, PictureUploader

	enum category: { pear: 1, rice: 2, pear_rice: 3 }
end
