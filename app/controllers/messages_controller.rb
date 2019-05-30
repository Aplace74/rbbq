class MessagesController < ApplicationController
  def index
    @messages = policy_scope(Message)
    authorize @messages
  end

  def new
    @message = Message.new
    authorize @message
    @receiver = User.find(params[:format])
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.sender_id = current_user.id
    if @message.save
      redirect_to messages_path(current_user)
    else
      render :new
    end
  end

  def read
    @message = Message.find(params[:id])
    authorize @message
    @message.read = true
    @message.save
    redirect_to messages_path
  end

  def destroy
    @message = Message.find(params[:id])
    authorize @message
    @message.destroy
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :content)
  end
end
