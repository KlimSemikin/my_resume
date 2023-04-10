class AddIndexToSkills < ActiveRecord::Migration[7.0]
  def change
    add_index :skills, :name, unique: true
  end
end
