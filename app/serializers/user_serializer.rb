class UserSerializer < ActiveModel::Serializer
  attributes :username, :first_name, :last_name, :email, :bio, :avatar, :created_at

  has_many :posts
  has_many :friends
end
