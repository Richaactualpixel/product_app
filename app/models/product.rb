class Product < ApplicationRecord
	belongs_to :user

	before_validation :normalize_name
  	before_save :generate_slug

	scope :product_type, -> product_type { where(product_type: product_type) }
	scope :price_order, -> (order) { order(price: order) }


  	validates :name, :price, :product_type, :user_id, presence: true

  	validates :product_type, inclusion: { in: %w[new old], message: "%{value} is not a valid product type, use new or old." }

  	private
  
  	def normalize_name
    	if self.name.present?
      		self.name = self.name.strip.downcase.titleize
    	end
  	end
  
  	def generate_slug
    	if self.name.present?
      		self.slug = self.name.parameterize
    	end
  	end
end
