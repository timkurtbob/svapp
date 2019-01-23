class Users::PendingsController < ApplicationController
  def index
   @pendings = policy_scope([:pending, User.super_admin])

  end
end
