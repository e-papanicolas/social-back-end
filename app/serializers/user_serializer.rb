class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :bio, :avatar

  has_many :posts
  has_many :friends
end
