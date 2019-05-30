class BarbecuesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search] 
  before_action :set_barbecue, only: [:show, :edit, :update, :destroy]
  before_action :bbq_name_title, only: [:show, :edit]

  def index
    if
      @barbecues = policy_scope(Barbecue)
    else
      @barbecues = policy_scope(Barbecue)
    end
    @title = "AirBBQ"
  end
  
	def show
    @booking = Booking.new
    @marker = []
    @marker << 
      {
        lat: @barbecue.latitude,
        lng: @barbecue.longitude,
        image_url: helpers.asset_url('logo.png')
      }
	end

  def new
    @barbecue = Barbecue.new
    authorize @barbecue
    @title = "Add your Barbecue"
  end

  def create
    @barbecue = Barbecue.new(barbecue_params)
    @barbecue.user = current_user
    authorize @barbecue
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
    if @barbecue.update(barbecue_params)
      redirect_to barbecue_path(@barbecue)
    else
      render :edit
    end
  end
  
  def search
    @title = "Search: #{params[:query]}"
    @barbecues = policy_scope(Barbecue).near(params[:query], 10)
    authorize @barbecues
    if @barbecues.empty?
      @barbecues = PgSearch.multisearch(params[:query])
      @barbecues = @barbecues.map do |result|
        Barbecue.find(result.searchable_id)
      end
      marker_map
    else
      @barbecues
      marker_map
    end
  end

  private

  def marker_map
    @marker = @barbecues.map do |barbecue|
      {
        lat: barbecue.latitude,
        lng: barbecue.longitude,
        image_url: helpers.asset_url('logo.png')
      }
    end
  end

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
