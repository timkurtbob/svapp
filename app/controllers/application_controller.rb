class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  #  permit extra params for devise

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:school_id])

    devise_parameter_sanitizer.permit(:account_update, keys: [:school_id])
  end


  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError do
    redirect_to root_url, alert: 'Du hast nicht die Rechte zu dieser Seite.'
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
