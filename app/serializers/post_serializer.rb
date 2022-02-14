class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :user

  def user
    User.find_by(id: self.object.user_id)
  end

  has_one :user
  has_many :likes
end
