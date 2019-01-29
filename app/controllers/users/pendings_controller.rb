class Users::PendingsController < ApplicationController
  def index
    @pending_users = policy_scope([:pending, User.where(approved: false)])
    if current_user.mitglied? && current_user.approved
      redirect_to user_path(current_user), notice: 'Your Account has already been approved!'
    end
  end

  def update
    @pending_user = User.find(params[:id])
    @pending_user.approved = pending_user_params
    authorize([:pending, @pending_user])
    if @pending_user.save
      redirect_to users_pendings_path
      flash[:notice] = "User #{@pending_user.first_name} has been approved!"
    else
      redirect_to users_pendings_path
      flash[:alert] =  "Something went wrong..."
    end
  end

  private

    def pending_user_params
    params.require(:user).permit(:approved)
  end
end
