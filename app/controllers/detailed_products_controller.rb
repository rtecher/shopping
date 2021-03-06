class DetailedProductsController < ApplicationController
  def index
  	if params[:search]
      query = params[:search]
  		@products = Product.where("title ILIKE ?", "%#{query}%").paginate(:page => params[:page], :per_page => 15)
  	elsif params[:minprice]
  		filters = {minprice: params[:minprice], maxprice: params[:maxprice], discounted: params[:discounted], enj: params[:enj], tabl: params[:tabl], pept: params[:pept]}
  		@products = Product.filter(filters).paginate(:page => params[:page], :per_page => 15)
    elsif params[:trademark]
      @products = Marka.where(name: params[:trademark]).first.products.paginate(:page => params[:page], :per_page => 15)
  	elsif params[:hazir]
      @products = Product.where(category: "Hazır Kürler").paginate(:page => params[:page], :per_page => 15)
    else
  		@products = Product.paginate(:page => params[:page], :per_page => 15)
  	end        
  end
end
