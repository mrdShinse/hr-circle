class AddColumnJobOfferDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :job_offers, :published_at,    :datetime, null: true,              after: :status
    add_column :job_offers, :employment_type, :integer,  null: false, default: 0, after: :published_at
    add_column :job_offers, :job_type,        :integer,  null: false, default: 0, after: :employment_type
  end
end
