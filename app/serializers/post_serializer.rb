class PostSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :user
  has_many :likes
end
