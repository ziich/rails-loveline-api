class Loveline < ApplicationRecord
  has_many :users
  has_many :posts
  has_many :prompt_lovelines
  has_many :prompts, through: :prompt_lovelines
end
