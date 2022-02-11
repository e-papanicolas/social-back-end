class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :confirmed
  has_one :user
  has_one :friend
end
