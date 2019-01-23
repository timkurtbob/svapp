class Users::PendingsController < ApplicationController
  def index
   @pending_users = policy_scope([:pending, User.beobachter])
  end

  def update
    raise
    @pending_user = User.find(params[:id])
    authorize @pending_user
  end

  private

    def pending_user_params
    params.require(:user).permit(:approved)
  end
end
