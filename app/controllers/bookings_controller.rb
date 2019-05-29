class BookingsController < ApplicationController
  def new
    @barbecue = Barbecue.find(params[:barbecue_id])
    authorize @booking
    @booking = Booking.new
  end

  def create
    @barbecue = Barbecue.find(params[:barbecue_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.barbecue = @barbecue
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_users_path(@user)
    else
      render :new
    end
  end

  def edit
    @barbecue = Barbecue.find(params[:barbecue_id])
    @booking = Booking.find(params[:id])
    authorize @booking
    title = "Edit for #{barbecue.name} "
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to dashboard_users_path(@user)
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_users_path(@user)
  end

  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.accepted = true
    @booking.save
    redirect_to dashboard_users_path(@user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
