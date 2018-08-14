class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :avatar_url
      t.integer :gender
      t.string :open_id

      t.timestamps
    end
  end
end
