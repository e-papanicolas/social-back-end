class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:name]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast("chat_#{params[:name]}", data)
  end

  def create(options)
    ChatMessage.create(
        user_id:opts["user_id"],
        chat_id: 1,
        content: "#{options["content"]}"
      )
  end


end
