class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :prompt_loveline
end
