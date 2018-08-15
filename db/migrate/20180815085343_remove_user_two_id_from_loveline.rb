class RemoveUserTwoIdFromLoveline < ActiveRecord::Migration[5.2]
  def change
    remove_column :lovelines, :user_two_id, :integer
  end
end
