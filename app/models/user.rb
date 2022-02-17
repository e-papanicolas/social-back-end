class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: { case_sensitive: false }


  has_many :posts, dependent: :destroy
  has_many :chat_messages, dependent: :destroy
  has_many :chats, through: :chat_messages

  
end
