class Prompt < ApplicationRecord
  has_many :prompt_lovelines
  has_many :lovelines, through: :prompt_lovelines
end
