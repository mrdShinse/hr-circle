class JobOffersController < NoAuthController

  def index
    @job_offers = JobOffer.published
  end

  def show
    @job_offer = JobOffer.find(params[:id])
  end
end
