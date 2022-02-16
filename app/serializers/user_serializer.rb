class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :email, :bio, :avatar, :created_at, :friends


  def friends
    self.object.friends.map {|friend| User.find_by(id: friend)}
  end
  has_many :posts
end
