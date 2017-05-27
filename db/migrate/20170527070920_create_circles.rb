class CreateCircles < ActiveRecord::Migration[5.1]
  def change
    create_table :circles do |t|
      t.string  :name,      null: false
      t.integer :circle_id, null: true,  comment: "circle id of super circle"

      t.timestamps
    end
  end
end
