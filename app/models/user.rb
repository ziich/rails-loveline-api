class User < ApplicationRecord
  acts_as_voter
  belongs_to :loveline
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :answers, dependent: :destroy
  # validates_presence_of :nickname, :avatar_url, :gender
end
