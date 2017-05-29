class AddRoleToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :role, :integer, null: false, default: 0
  end
end
