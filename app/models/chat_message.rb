class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates_presence_of :content, :chat_id, :user_id

  # after_create_commit do
  #   ChatMessageJob.perform_later({chat_messages: self}.to_json)
  # end
end
