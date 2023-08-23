class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :turbo_frame_request_variant

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name] )
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name] )
 end

  private

  def turbo_frame_request_variant
    request.variant = :turbo_frame if turbo_frame_request?
  end

  def logged_in_owner
    unless !current_owner.nil?
      flash[:danger] = "Please log in."
      redirect_to new_owner_session_url
    end
  end

  def has_pets
    if !current_owner.pets.present?
      flash[:danger] = "Please add a pet first to have access to this part of the app."
      redirect_to root_path
    end
  end

  def correct_owner
    @owner = Owner.find(params[:id])
    redirect_to(root_url) unless current_user?(@owner)
  end

end
