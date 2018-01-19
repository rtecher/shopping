class DetailedProductsController < ApplicationController
  def index
  	if params[:search]
  		@products = Product.search(params[:search])
  	elsif params[:minprice]
  		filters = {minprice: params[:minprice], maxprice: params[:maxprice], discounted: params[:discounted], enj: params[:enj], tabl: params[:tabl], pept: params[:pept]}
  		@products = Product.filter(filters)
  	else
  		@products = Product.all
  	end
  end
end
