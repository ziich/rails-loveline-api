class AddScoreToLoveline < ActiveRecord::Migration[5.2]
  def change
    add_column :lovelines, :score, :integer, default: 0, null: false
  end
end
