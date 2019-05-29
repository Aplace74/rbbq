class BarbecuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] 
  before_action :set_barbecue, only: [:show, :edit, :update, :destroy]
  before_action :bbq_name_title, only: [:show, :edit]

  def index
    @barbecues = Barbecue.all
    @barbecues = policy_scope(Barbecue)
    @title = "AirBBQ"
  end
  
	def show
    @booking = Booking.new
    @marker = []
    @marker << 
      {
        lat: @barbecue.latitude,
        lng: @barbecue.longitude,
      }
	end

  def new
    @barbecue = Barbecue.new
    authorize @barbecue
    @title = "Add your Barbecue"
  end

  def create
    @barbecue = Barbecue.new(barbecue_params)
    authorize @barbecue
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
    @barbecue.destroy
    redirect_to dashboard_users_path
	end
	
	def edit
	end

	def update
		@barbecue.user = current_user
		@barbecue.update(barbecue_params)
		redirect_to barbecue_path(@barbecue)
	end

  private

  def barbecue_params
    params.require(:barbecue).permit!
  end

  def set_barbecue
    @barbecue = Barbecue.find(params[:id])
    authorize @barbecue
  end

  def bbq_name_title
    @title = @barbecue.name
  end
  
end
