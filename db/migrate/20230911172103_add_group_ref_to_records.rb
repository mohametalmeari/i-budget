class AddGroupRefToRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :records, :group, null: false, foreign_key: true
  end
end
