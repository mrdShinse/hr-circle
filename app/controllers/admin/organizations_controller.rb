class Admin::OrganizationsController < ApplicationController

  before_action :set_organization, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @organization.update(organization_params)
      redirect_to admin_organization_path, flash: { success: 'success' }
    else
      flash[:error] = 'error'
      render :edit
    end
  end

  private
    def set_organization
      @organization = Organization.all.first
    end

    def organization_params
      params.require(:organization).permit(:name)
    end
end
