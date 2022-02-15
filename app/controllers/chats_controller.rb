class ChatsController < ApplicationController

  def create 
    existing_chat = Chat.find_by(id: params[:id])

    if existing_chat
      render json: existing_chat.to_json(include: [:chat_messages])
      ActionCable.server.broadcast("chat_#{params[:name]}", {chat: existing_chat, messages: existing_chat.chat_messages})
    else
      new_chat = Chat.create!(chat_params)
      render json: new_chat.to_json(include: [:chat_messages])
      ActionCable.server.broadcast("chat_#{params[:name]}", {chat: new_chat, messages: new_chat.chat_messages})
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:name)
  end

end
