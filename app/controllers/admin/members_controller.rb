# frozen_string_literal: true

class AdminMembersController < ApplicationController # :nodoc:
  before_action :set_circle

  def index
    @organization = Organization.find(1)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_circle
    @circle = Circle.find_by!(id: params[:circle_id])
  end

  # Only allow a trusted parameter "white list" through.
  def member_params
    params.require(:person).permit(:name)
  end
end
