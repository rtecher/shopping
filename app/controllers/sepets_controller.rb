class SepetsController < ApplicationController
  before_action :set_product, only: [:create, :destroy]
  before_action :set_sepet, only: [:destroy]

  def index
  	@sepets = Sepet.where(user: current_user)
  end

  def create
  	@sepet = Sepet.new(sepet_params)
  	@sepet.user = current_user
    respond_to do |format|
    	if @sepet.save
    		  format.html { redirect_to @product, notice: 'Favorilere eklendi.' }
          format.json { render :show, status: :ok, location: @product }
      else
          format.html { render @product }
          format.json { render json: @sepet.errors, status: :unprocessable_entity }
    	end
    end
  end

  def destroy
  	@sepet.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: 'Favorilerden çıkarıldı.' }
      format.json { head :no_content }
    end
  end

  private

  def set_sepet
    @product = Product.find(params[:product_id])
  	@sepet = current_user.sepets.where(product: @product).first
  end

  def set_product
  	@product = Product.find(params[:product_id])
  end

  def sepet_params
  	params.permit(:product_id)
  end
end
