class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  # GET /products
  # GET /products.json
  def index
    @new_products = Product.order(created_at: :desc).take(4)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = Comment.where(product_id: @product)
    @random = Product.all.sample(3)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
