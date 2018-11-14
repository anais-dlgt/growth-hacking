class AddIndexToTargetEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :targets, :email, unique: true
  end
end
