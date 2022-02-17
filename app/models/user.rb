class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: { case_sensitive: false }

  has_many :posts
  has_many :chat_messages
  has_many :chats, through: :chat_messages
  
end
