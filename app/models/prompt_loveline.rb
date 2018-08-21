class PromptLoveline < ApplicationRecord
  belongs_to :prompt
  belongs_to :loveline
  has_many :answers, dependent: :destroy
end
