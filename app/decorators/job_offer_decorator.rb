module JobOfferDecorator
  def job_type_label
    undefined? ? '' : job_type
  end
end
