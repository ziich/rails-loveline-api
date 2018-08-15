class RemoveUserOneIdFromLoveline < ActiveRecord::Migration[5.2]
  def change
    remove_column :lovelines, :user_one_id, :integer
  end
end
