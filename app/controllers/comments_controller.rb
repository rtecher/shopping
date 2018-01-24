class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @product = Product.find(params[:product_id])
    @comment = Comment.create(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.product_id = @product.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
end
