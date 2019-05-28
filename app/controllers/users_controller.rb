class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @bookings = Booking.where(@user.id == :user_id)
  end

  def show
    @user = User.find(params[:id])
  end
end
