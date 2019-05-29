class BookingsController < ApplicationController
  def new
    @barbecue = Barbecue.find(params[:barbecue_id])
    @booking = Booking.new
  end

  def create
    @barbecue = Barbecue.find(params[:barbecue_id])
    @booking = Booking.new(booking_params)
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
    title = "Edit for #{barbecue.name} "
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to dashboard_users_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_users_path(@user)
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
    redirect_to dashboard_users_path(@user)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
