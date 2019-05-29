class MessagesController < ApplicationController
  def index
    @sent = Message.where(sender_id: current_user.id).order(:created_at)
    @receipt = Message.where(receiver_id: current_user.id).order(:created_at)
    @message = Message.new
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

  def chat
  end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :content)
  end
end
