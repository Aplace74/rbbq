class BarbecuesController < ApplicationController

	def index
		@barbecues = Barbecue.all
	end
	
	def new
		@user = User.find(params[:user_id])
		@barbecue = Barbecue.new
	end

	def create
		@barbecue = Barbecue.new(barbecue_params)
		@barbecue.user = User.find(params[:user_id])
		if @barbecue.save
      redirect_to user_barbecue_path(@barbecue)
    else
      render :new
    end
		@barbecue.save
	end

	private

	def barbecue_params
		params.require(:barbecue).permit(:content)
	end

end
