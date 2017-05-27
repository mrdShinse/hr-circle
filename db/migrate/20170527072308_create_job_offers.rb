class CreateJobOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :job_offers do |t|
      t.integer :circle_id, null: false
      t.string  :title,     null: false
      t.text    :content,   null: true
      t.integer :status,    null: false

      t.timestamps
    end
  end
end
