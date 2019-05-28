class BarbecuesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @barbecues = Barbecue.all
    @title = "AirBBQ"
  end

	def show
    @barbecue = Barbecue.find(params[:id])
    bbq_name_title
	end

  def new
    @barbecue = Barbecue.new
    @title = "Add your Barbecue"
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
	
	def edit
    @barbecue = Barbecue.find(params[:id])
    bbq_name_title
	end

	def update
		@barbecue = Barbecue.find(params[:id])
		@barbecue.user = current_user
		@barbecue.update(barbecue_params)
		redirect_to barbecue_path(@barbecue)
	end

  private

  def barbecue_params
    params.require(:barbecue).permit!
  end

  def bbq_name_title
    @title = @barbecue.name
  end
  
end
