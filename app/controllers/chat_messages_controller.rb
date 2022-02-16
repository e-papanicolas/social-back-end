class ChatMessagesController < ApplicationController
  before_action do
    @chat = Chat.find_by(id: params[:chat_id])
  end

  def index
    @messages = @chat.chat_messages 
  end

  def create
    @message = ChatMessage.create!(message_params)
    ActionCable.server.broadcast("chat_#{params[:chat_id]}", @message)
  end
  
  private

  def message_params
    params.permit(:content, :user_id, :chat_id)
  end
end
