class Users::PendingsController < ApplicationController
  def index
   @pending_users = policy_scope([:pending, User.where(approved: false)])
  end

  def update
    @pending_user = User.find(params[:id])
    @pending_user.approved = true
    authorize([:pending, @pending_user])
    if @pending_user.save
      redirect_to users_pendings_path
      flash[:notice] = "User #{@pending_user.first_name} has been approved!"
    else
      raise
      redirect_to users_pendings_path
      flash[:error] =  "Something went wrong..."
    end
  end

  private

    def pending_user_params
    params.require(:user).permit(:approved)
  end
end
