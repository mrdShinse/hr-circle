class Admin::CirclesController < ApplicationController

  before_action :set_circle, only: [:edit, :update, :destroy]

  def index
    @circles = Circle.all
  end

  def new
    @circle = Circle.new do |o|
    end
  end

  def edit
  end

  def create
    @circle = Circle.new(circle_params)

    if @circle.save
      redirect_to admin_circles_path, flash: { success: 'success' }
    else
      flash[:error] = 'error'
      render :new
    end
  end

  def update
    @circle.people.push(Person.where(id: circle_params[:person_ids])) if circle_params[:person_ids]
    @circle.save!
    if @circle.update(circle_params)
      redirect_to admin_circles_path, flash: { success: 'success' }
    else
      flash[:error] = 'error'
      render :edit
    end
  end

  def destroy
    if @circle.destroy
      redirect_back fallback_location: admin_circles_url, flash: { success: 'success' }
    else
      redirect_back fallback_location: admin_circles_url, flash: { success: 'error' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_circle
    @circle = Circle.find_by!(id: params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def circle_params
    params.require(:circle).permit(:name, :person_ids)
  end
end
