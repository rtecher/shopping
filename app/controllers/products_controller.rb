class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  # GET /products
  # GET /products.json
  def index
    @new_products = Product.where.not(category: "Hazır Kürler").order(created_at: :desc).take(8)
    @fav_products = Product.all.take(8)
    @hazir_kurler = Product.where(category: "Hazır Kürler").take(8)
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = Comment.where(product_id: @product).where(:confirmed => true)
    @random = Product.all.sample(4)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end
end
