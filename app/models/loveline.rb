class Loveline < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :posts
  has_many :prompt_lovelines, dependent: :destroy
  has_many :prompts, through: :prompt_lovelines
end
