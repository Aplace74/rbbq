class BarbecuesController < ApplicationController

	def index
		@barbecues = Barbecue.all
	end
	
	def new
		@user = User.find(params[:user_id])
		@barbecue = Barbecue.new
	end

	def create
		@barbecue = Barbecue.new
		@barbecue.user = User.find(params[:user_id])
		@barbecue.save
	end

	private

	def barbecue_params
		params.require(:barbecue).permit(:content)
	end

end
