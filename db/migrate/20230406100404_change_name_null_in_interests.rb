class ChangeNameNullInInterests < ActiveRecord::Migration[7.0]
  def change
    change_column_null :interests, :name, false
  end
end
