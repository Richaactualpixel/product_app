class Product < ApplicationRecord
	belongs_to :user

	scope :product_type, -> product_type { where(product_type: product_type) }
	scope :price_order, -> (order) { order(price: order) }


  	validates :name, :price, :product_type, :user_id, presence: true

  	validates :product_type, inclusion: { in: %w[new old], message: "%{value} is not a valid product type, use new or old." }

end
