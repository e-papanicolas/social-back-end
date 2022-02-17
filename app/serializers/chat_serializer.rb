class ChatSerializer < ActiveModel::Serializer
  attributes :id, :sender, :recipient
  
  has_many :chat_messages
  has_many :users
end
