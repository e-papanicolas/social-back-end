class ChatChannel < ApplicationCable::Channel


  def subscribed
    stream_from "chat_#{params[:chat_id]}"
   
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast("chat_#{params[:chat_id]}", data)
  end

  # def create(options)
  #   ChatMessage.create(
  #       user_id:opts["user_id"],
  #       chat_id: 1,
  #       content: "#{options["content"]}"
  #     )
  # end


end
