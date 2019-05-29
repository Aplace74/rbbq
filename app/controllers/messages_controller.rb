class MessagesController < ApplicationController
  def index
    @sent = Message.where("sender= ?", current_user).order(:created_at)
    @receipt = Message.where("receiver= ?", current_user).order(:created_at)
  end

  def create
  end

  def chat
  end
end
