class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments
  has_secure_password

  validates :username, presence: true, uniqueness: true
end
