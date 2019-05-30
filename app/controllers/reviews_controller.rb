class ReviewsController < ApplicationController
  def new
    @barbecue = Barbecue.find(params[:barbecue_id])
    @review = Review.new
    authorize @review
  end

  def create
    @barbecue = Barbecue.find(params[:barbecue_id])
    @review = Review.new(review_params)
    authorize @review
    @review.barbecue = @barbecue
    @review.user = current_user
    if @review.save
      redirect_to barbecue_path(@barbecue)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
