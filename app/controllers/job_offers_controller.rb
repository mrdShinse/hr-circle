class JobOffersController < ApplicationController

  before_action :set_job_offer, only: [:edit, :update, :destroy]

  def index
    @job_offers = JobOffer.all
  end

  def new
    @job_offer = JobOffer.new do |o|
      o.status = JobOffer.statuses[:unpublished]
      o.circle_id = 1
    end
  end

  def edit
  end

  def create
    @job_offer = JobOffer.new(job_offer_params)

    if @job_offer.save
      redirect_to job_offers_path, flash: { success: 'success' }
    else
      flash[:error] = 'error'
      render :new
    end
  end

  def update
    if @job_offer.update(job_offer_params)
      redirect_to job_offers_path, flash: { success: 'success' }
    else
      flash[:error] = 'error'
      render :edit
    end
  end

  def destroy
    if @job_offer.destroy
      redirect_back fallback_location: job_offers_url, flash: { success: 'success' }
    else
      redirect_back fallback_location: job_offers_url, flash: { success: 'error' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_offer
      @job_offer = JobOffer.find_by!(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_offer_params
      params.require(:job_offer).permit(:title, :content, :circle_id, :status)
    end
end
