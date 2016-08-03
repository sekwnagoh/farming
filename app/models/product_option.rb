class ProductOption < ActiveRecord::Base
	validates_presence_of :product_id
	validates :price, presence: true, numericality: { grater_than: 999}
  	
  	belongs_to :product

  	enum grade: {"S" => 100, "A" => 101, "B" => 102, "C" => 103 }
	enum weight: { "4kg" => 200, "10kg" => 201, "20kg" => 202, "40kg" => 204, "7.5kg" => 300}

	scope :by_weight, -> (weight_string) { where(weight: weight_string) }
end
