class ChatUserSerializer < ActiveModel::Serializer
  attributes :id, :chat_messages

  def uniq_users
    self.users.uniq
  end
end
