class ReviewsController < ApplicationController

  def create
    @barbecue = Barbecue.find(params[:barbecue_id])
    @review = Review.new(review_params)
    @review.barbecue = @barbecue
    @review.user = current_user
    authorize @review

    if @review.save
      respond_to do |format|
        format.html { redirect_to barbecue_path(@barbecue) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'barbecues/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
