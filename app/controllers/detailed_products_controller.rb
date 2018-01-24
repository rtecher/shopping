class DetailedProductsController < ApplicationController
  def index
  	if params[:search]
  		@products = Product.search(params[:search]).paginate(:page => params[:page], :per_page => 15)
  	elsif params[:minprice]
  		filters = {minprice: params[:minprice], maxprice: params[:maxprice], discounted: params[:discounted], enj: params[:enj], tabl: params[:tabl], pept: params[:pept]}
  		@products = Product.filter(filters).paginate(:page => params[:page], :per_page => 15)
  	else
  		@products = Product.paginate(:page => params[:page], :per_page => 15)
  	end        
  end
end
