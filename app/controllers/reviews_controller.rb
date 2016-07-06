class ReviewsController < ApplicationController
  before_action :require_user

  def create
    if params[:product_id]
      @product = Product.find(params[:product_id])
    else
      set_product
    end
    review = @product.reviews.build(review_params.merge!(user: current_user))
    if review.save
      redirect_to @product
    else
      @reviews = @product.reviews.reload
      render 'products/list'
    end
  end


  private

  def review_params
    params.require(:review).permit(:content)
  end
end
