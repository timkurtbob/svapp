class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
    unless current_user.admin? || current_user.super_admin?
      redirect_to entries_path, alert: 'Du hast nicht die Rechte zu dieser Seite.'
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    if current_user.admin? || current_user.super_admin?
      @user = User.find(params[:id])
      @user.role = edit_user_params[:role].to_i
      authorize @user
      if @user.save
        redirect_to user_path(@user), notice: "Sucessfully changed #{@user.first_name} to #{@user.role}."
      else
        redirect_to user_path(@user), alert: "Could not update role."
      end
    else
      redirect_to user_path(@user), alert: "You don't have permission to update the role."
    end
  end

  private

  def edit_user_params
    params.require(:user).permit(:role)
  end
end
