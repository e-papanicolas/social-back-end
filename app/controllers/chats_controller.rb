class ChatsController < ApplicationController

  def index 
    @users = User.all
    @chats = Chat.all
  end

  def show 
    user = User.find_by(id: params[:id])
    chats = user.chats.uniq 
    render json: chats
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

  def destroy
    chat = Chat.find_by(id: params[:id])
    chat.destroy
    head :no_content
  end
  
  private
  
  def chat_params
    params.permit(:name, :sender_id, :recipient_id)
  end
  
end