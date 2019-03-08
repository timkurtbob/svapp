class CirclesController < ApplicationController
  after_action :verify_policy_scoped, except: [ :index ]

  def index
    @circles = Circle.all
    authorize @circles
  end
end
