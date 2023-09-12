class AddUniqueIndexToGroupsNameAndUserId < ActiveRecord::Migration[7.0]
  def change
    add_index :groups, [:user_id, :name], unique: true
  end
end
