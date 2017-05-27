class JobOffer < ApplicationRecord

  enum status: {
    unpublished: 0,
    published:   1,
    closed:      9,
  }

end
