class ChatChannel < ApplicationCable::Channel

  def subscribed
    this_chat = Chat.find_by(id: params[:chat_id])
    stream_for this_chat
    # stream_from "chat_#{params[:chat_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def receive(data)
  #   ActionCable.server.broadcast("chat_#{params[:chat_id]}", data)
  # end

end
