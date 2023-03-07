class Product < ApplicationRecord
	scope :product_type, -> product_type { where(product_type: product_type) }
	scope :price_order, -> (order) { order(price: order) }

end
