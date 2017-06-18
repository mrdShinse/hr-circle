class CreateCirclesPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :circles_people, :id => false do |t|
      t.integer :circle_id
      t.integer :person_id
    end

    add_index :circles_people, [:circle_id, :person_id]
  end
end
