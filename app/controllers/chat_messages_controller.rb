class ChatMessagesController < ApplicationController


  # find all chat messages with the chat id and user id match
  # def index 
  #   ChatMessage.all(where "user_id == user.id")
  # end
  # def show 
  #   messages = ChatMessage.all()
  # end

  def create
    chat_message = ChatMessage.create!(message_params)
    # new_msg = ChatMessage.create!(message_params)
    ActionCable.server.broadcast("chat_#{params[:chat_id]}", chat_message)
    # render json: new_msg, status: :created
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_id, :user_id)
  end
end
