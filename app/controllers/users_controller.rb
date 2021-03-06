class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def dashboard
    @user = current_user
    authorize @user
    @bookings = Booking.where(@user.id == :user_id)
    @title = "Dashboard"
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @title = "#{@user.first_name} #{@user.last_name}"
  end
end
