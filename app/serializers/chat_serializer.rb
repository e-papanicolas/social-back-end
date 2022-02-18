class ChatSerializer < ActiveModel::Serializer
  attributes :id, :sender, :recipient, :updated_at
  
  has_many :chat_messages, serializer: ChatMessageSerializer
  has_many :users, serializer: UserSerializer
end
