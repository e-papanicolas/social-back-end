class ChatsController < ApplicationController

  def index 
    @users = User.all
    @chats = Chat.all
  end

  def show 
    user = User.find_by(id: params[:id])
    chats = user.chats.uniq  

    # chat_array = []

    # chats.map do |chat|
      # friends_msg = chat.chat_messages
      # friends_msg2 = friends_msg.where(friends_msg.user_id != user.id)
      # friend = friends_msg2.user_id
      # chat = {
      #   id: chat.id, 
      #   updated_at: chat.updated_at, 
      #   sender: chat.chat_messages.last.user,
      #  friend: friend
      # }

    #   chat_array.push(chat)
    # end

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
  
  private
  
  def chat_params
    params.permit(:name, :sender_id, :recipient_id)
  end
  
end