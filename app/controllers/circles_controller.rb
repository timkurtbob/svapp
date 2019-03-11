class CirclesController < ApplicationController
  after_action :verify_policy_scoped, except: [ :index, :show, :create ]

  def index
    @circles = Circle.all
    authorize @circles
    @circle = Circle.new
  end

  def show
    circle = Circle.find(params[:id])
    authorize circle
    @entries = circle.entries
  end

  def create
    @circle = Circle.new(circle_params)
    authorize @circle

    @circle.save
    redirect_to circles_path
  end

  def circle_params
    params.require(:circle).permit(:name)
  end
end
