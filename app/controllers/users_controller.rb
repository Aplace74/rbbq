class UsersController < ApplicationController
  
  def dashboard
    @user = current_user
    authorize @user
    @bookings = Booking.where(@user.id == :user_id)
    @title = "#{@user.first_name} #{@user.last_name} Dashboard"
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @title = "#{@user.first_name} #{@user.last_name}"
  end
end
