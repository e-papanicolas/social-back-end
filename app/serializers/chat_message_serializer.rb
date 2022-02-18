class ChatMessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :chat_id, :created_at
  
  belongs_to :user, serializer: UserSerializer
  belongs_to :chat, serializer: ChatSerializer
end