class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :bio, :avatar, :created_at, :friends

  has_many :posts
end
