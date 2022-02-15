class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  # after_create_commit do
  #   ChatMessageJob.perform_later({chat_messages: self}.to_json)
  # end
end
