class ProductOption < ActiveRecord::Base
	validates_uniqueness_of :price, scope: [ :product_id, :weight, :grade ]
  belongs_to :product
end
