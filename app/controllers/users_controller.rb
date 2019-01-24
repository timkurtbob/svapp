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
end
