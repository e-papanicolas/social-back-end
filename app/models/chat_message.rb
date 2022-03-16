class ChatMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates_presence_of :content, :chat_id, :user_id
end
