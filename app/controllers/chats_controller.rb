class ChatsController < ApplicationController

  def index 
    @users = User.all
    @chats = Chat.all
  end

  def create 
    if Chat.between(params[:sender_id], params[:recipient_id]).present? 
      @chat = Chat.between(params[:sender_id], params[:recipient_id]).first
    else
      @chat = Chat.create!(chat_params)
    end
    render json: @chat.to_json(include: [:chat_messages])
    ActionCable.server.broadcast("chat_#{params[:chat_id]}", {chat: @chat, messages: @chat.chat_messages})
  end
  
  private
  
  def chat_params
    params.permit(:name, :sender_id, :recipient_id)
  end
  
end

# existing_chat = Chat.find_by(id: params[:id])

# if existing_chat
#   render json: existing_chat.to_json(include: [:chat_messages])
#   ActionCable.server.broadcast("chat_#{params[:name]}", {chat: existing_chat, messages: existing_chat.chat_messages})
# else
#   new_chat = Chat.create!(chat_params)
#   render json: new_chat.to_json(include: [:chat_messages])
#   ActionCable.server.broadcast("chat_#{params[:name]}", {chat: new_chat, messages: new_chat.chat_messages})
# end