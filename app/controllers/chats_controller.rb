class ChatsController < ApplicationController



  def show 
    chat = Chat.find(params[:name])
    ActionCable.server.broadcast("chat_#{params[:name]}", chat)
    render json: chat.to_json(include: [:chat_messages])
  end

  def create 
    chat = Chat.find_or_create_by(params[:id])
    # ActionCable.server.broadcast("chat_#{params[:name]}", chat)
    render json: chat.to_json(include: [:chat_messages])
  end


  private

  def chat_params
    params.require(:chat).permit(:name)
  end
end
