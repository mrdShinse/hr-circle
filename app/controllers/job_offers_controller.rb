class JobOffersController < ApplicationController

  def index
    @job_offers = JobOffer.published
  end
end
