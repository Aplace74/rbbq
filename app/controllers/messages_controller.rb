class MessagesController < ApplicationController
  def index
    @messages = Message.where("sender_id = #{current_user.id}")
                       .or(Message.where("receiver_id = #{current_user.id}"))
                       .order(:created_at)
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    if @message.save
      redirect_to messages_path(current_user)
    else
      render :index
    end
  end

  def read
    @message = Message.find(params[:id])
    @message.read = true
    @message.save
    redirect_to messages_path
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :content)
  end
end
