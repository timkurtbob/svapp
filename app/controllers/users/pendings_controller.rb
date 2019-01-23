class Users::PendingsController < ApplicationController
  def index
   @pending_users = policy_scope([:pending, User.beobachter])
  end
end
