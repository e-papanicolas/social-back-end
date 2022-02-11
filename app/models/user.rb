class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: { case_sensitive: false }

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :posts
  
end
