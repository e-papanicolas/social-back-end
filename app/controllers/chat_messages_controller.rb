class ChatMessagesController < ApplicationController

  def index
    chat = Chat.find_by(id: params[:chat_id])
    messages = chat.chat_messages 
  end

  def create
    @message = ChatMessage.create!(message_params)
    @chat = Chat.find(@message[:chat_id])
    ChatChannel.broadcast_to(@chat, @message)
    render json: @message
    # ActionCable.server.broadcast("chat_#{params[:chat_id]}", @message)
  end
  
  private

  def message_params
    params.permit(:content, :user_id, :chat_id)
  end
end
