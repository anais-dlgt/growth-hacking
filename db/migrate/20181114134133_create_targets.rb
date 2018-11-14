class CreateTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :targets do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :type

      t.timestamps
    end
  end
end
