class ProductsController < ApplicationController

  has_scope :product_type
  has_scope :price_order

  # GET /products
  #params filter{product_type: new/old, price_order: asc{low to high}/desc{high to low}}
  def product_list
    @p = Product.all
    @products = apply_scopes(@p)
    render json: {products: @products}
  end
end
