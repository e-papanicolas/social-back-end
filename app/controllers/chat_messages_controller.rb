class ChatMessagesController < ApplicationController

  def create
    chat_message = ChatMessage.create!(message_params)
    ActionCable.server.broadcast("chat_#{params[:chat_id]}", chat_message)
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_id, :user_id)
  end
end
