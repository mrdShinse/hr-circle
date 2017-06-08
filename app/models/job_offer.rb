class JobOffer < ApplicationRecord
  belongs_to :circle

  enum status: {
    unpublished: 0,
    published:   1,
    closed:      9
  }

  enum job_type: {
    undefined:  0,
    engineer:  10,
    sales:     20
  }

  enum employment_type: {
    full_time:  0,
    part_time: 10
  }
end
