class BookingsController < ApplicationController

    def new
        @booking = Booking.new
    end

    def create
        @booking = Booking.new(booking_params)
        @booking.save
        redirect_to dashboard_users_path(@user)
    end

    def edit
        @booking = Booking.find(params[:id])
    end

    def update
        @booking = Booking.find(params[:id])
        @booking.update(booking_params)
        redirect_to dashboard_users_path(@user)
    end

    def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        redirect_to dashboard_users_path(@user)
    end

    private

    def booking_params
        params.require(:booking).permit(:start_date, :end_date)
    end

end
