class User < ApplicationRecord
  acts_as_voter
  belongs_to :loveline
  has_many :comments
  has_many :posts
  validates_presence_of :nickname, :avatar_url, :gender
end
