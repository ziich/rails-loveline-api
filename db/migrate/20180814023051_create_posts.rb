class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.text :image_url
      t.references :loveline, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
