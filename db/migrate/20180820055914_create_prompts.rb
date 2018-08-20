class CreatePrompts < ActiveRecord::Migration[5.2]
  def change
    create_table :prompts do |t|
      t.text :content
      t.integer :score, default: 10, null: false

      t.timestamps
    end
  end
end
