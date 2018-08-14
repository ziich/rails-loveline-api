class User < ApplicationRecord
  acts_as_voter
  has_many :comments
  has_many :posts
  validates :nickname, presence: true
  validates :avatar_url, presence: true
  validates :gender, prensence: true
end
