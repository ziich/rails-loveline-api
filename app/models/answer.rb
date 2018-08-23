class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :prompt_loveline
  validates :content, presence: true
end
