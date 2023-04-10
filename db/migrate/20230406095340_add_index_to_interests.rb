class AddIndexToInterests < ActiveRecord::Migration[7.0]
  def change
    add_index :interests, :name, unique: true
  end
end
