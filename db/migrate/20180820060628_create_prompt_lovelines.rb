class CreatePromptLovelines < ActiveRecord::Migration[5.2]
  def change
    create_table :prompt_lovelines do |t|
      t.references :prompt, foreign_key: true
      t.references :loveline, foreign_key: true

      t.timestamps
    end
  end
end
