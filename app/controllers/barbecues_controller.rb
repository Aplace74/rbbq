class BarbecuesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @barbecues = Barbecue.all
  end

	def show
		@barbecue = Barbecue.find(params[:id])
	end

  def new
    @barbecue = Barbecue.new
  end

  def create
    @barbecue = Barbecue.new(barbecue_params)
    @barbecue.user = current_user
    @barbecue.save!
    if @barbecue.save
      redirect_to barbecue_path(@barbecue)
    else
      render :new
    end
    @barbecue.save
  end

  def destroy
    @barbecue = Barbecue.find(params[:id])
    @barbecue.destroy
    redirect_to dashboard_users_path
  end

  private

  def barbecue_params
    params.require(:barbecue).permit!
  end
end
