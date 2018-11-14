class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :targets, :type, :status
  end
end
