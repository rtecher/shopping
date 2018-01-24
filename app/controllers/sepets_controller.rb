class SepetsController < ApplicationController
  before_action :set_product, only: [:create, :destroy]
  before_action :set_sepet, only: [:destroy]

  def index
  	@sepets = Sepet.where(user: current_user)
  end

  def create
  	@sepet = Sepet.new(sepet_params)
  	@sepet.user = current_user

   if @sepet.save
    flash.now[:notice] = 'Favorilere eklendi!'
   else
    flash.now[:alert] = 'Hata!'
   end
  respond_to do |format|
    format.html { redirect_to products_url}
  end
end

  def destroy
  	@sepet.destroy
    flash.now[:alert] = 'Favorilerden Çıkarıldı!'
    respond_to do |format|
      format.html { redirect_to sepets_path }
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
