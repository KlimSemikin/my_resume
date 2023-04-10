class ChangeNameNullInSkills < ActiveRecord::Migration[7.0]
  def change
    change_column_null :skills, :name, false
  end
end
