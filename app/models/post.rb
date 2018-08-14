class Post < ApplicationRecord
  acts_as_votable
  serialize :image_url,Array
  belongs_to :loveline
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true
  validates :title, presence: true
  def num_likes
    get_likes.size
  end

  def num_comments
    comments.size
  end

  def post_created_at
    created_at.strftime("%A, %b %d, %Y")
  end
end
