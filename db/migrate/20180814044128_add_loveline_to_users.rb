class AddLovelineToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :loveline, foreign_key: true
  end
end
