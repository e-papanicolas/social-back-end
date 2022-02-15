class ChatMessageJob < ApplicationJob
  # queue_as :default

  # def perform(chat_message)
  #   # Do something later
  #   ActionCable
  #     .server
  #     .broadcast("chat_#{params[:name]}", chat_message)
  # end
end
