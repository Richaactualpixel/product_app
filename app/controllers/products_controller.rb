class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  has_scope :product_type, only: [:product_list]
  has_scope :price_order, only: [:product_list]

  before_action :check_product_uniqueness, only: [:create]
  
  # GET /products
  #params filter{product_type: new/old, price_order: asc{low to high}/desc{high to low}}
  def product_list
    @product_data = Product.all
    @products = apply_scopes(@product_data)
    render json: {products: @products}
  end

  #POST /create_product
  #create a product by a user
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  
  private

  def product_params
    params.require(:product).permit(:name, :price, :product_type, :user_id)
  end

  #Check product name uniqueness for a user
  def check_product_uniqueness
    @product = Product.where(name: params[:name], user_id: params[:user_id])
    
    if @product.present?
      render json: {message: "product name should be unique for a user" }, status: :unprocessable_entity
    end
  end
end
