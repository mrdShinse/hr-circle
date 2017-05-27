class CreateCirclesPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :circles_people, :id => false do |t|
      t.integer :circles_id
      t.integer :person_id
    end

    add_index :circles_people, [:circles_id, :person_id]
  end
end
