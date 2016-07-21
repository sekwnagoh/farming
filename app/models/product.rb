class Product < ActiveRecord::Base
	has_many :product_options

	enum category: { pear: 1, rice: 2, pear_rice: 3 }

	mount_uploader :picture, PictureUploader

	def product_option(options = {})
		product_options.where(weight: options[:weight], grade: options[:grade]).first
	end
end
