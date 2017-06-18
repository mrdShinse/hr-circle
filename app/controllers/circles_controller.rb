# frozen_string_literal: true

class CirclesController < NoAuthController # :nodoc:
  def index
    @circles = Circle.all
  end

  def show
    @circle = Circle.find(params[:id])
  end
end
