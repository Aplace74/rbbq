class MessagesController < ApplicationController
  def index
    @messages = policy_scope(Message)
    authorize @messages
    @title = "My Messages"
  end

  def new
    @message = Message.new
    authorize @message
    @receiver = User.find(params[:id])
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    @message.sender_id = current_user.id
    if @message.save
      respond_to do |format|
        format.html { redirect_to messages_path(@message) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'messages/show' }
        format.js  # <-- idem
      end
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
  end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :content)
  end
end
