class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
    unless current_user.admin? || current_user.super_admin?
      redirect_to entries_path, alert: 'Fehlende Admin-Rechte.'
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
      if  edit_user_params[:role].to_i == 0  && !current_user.super_admin?
          redirect_to users_path, alert: "You don't have this permission."
      else
        if @user.save
          redirect_to user_path(@user), notice: "Erfolgreich geändert: #{@user.first_name} ist #{@user.role}."
        else
          redirect_to user_path(@user), alert: "Wurde nicht geändert."
        end
      end
    else
      redirect_to user_path(@user), alert: "Fehlende Admin-Rechte."
    end
  end

  private

  def edit_user_params
    params.require(:user).permit(:role)
  end
end
