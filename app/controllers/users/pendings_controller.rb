class Users::PendingsController < ApplicationController
  def index
   @pending_users = policy_scope([:pending, User.beobachter])
  end

  def create
    @pending_user = User.find(params[:id])
    authorize @pending_user
  end
end
