class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show
  def dashboard
    @user = current_user
    @bookings = Booking.where(@user.id == :user_id)
    @title = "#{@user.first_name} #{@user.last_name} Dashboard"
  end

  def show
    @user = User.find(params[:id])
    @title = "#{@user.first_name} #{@user.last_name}"
  end
end
