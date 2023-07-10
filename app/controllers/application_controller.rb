class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name] )
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name] )
 end

 private
  def logged_in_owner
    unless !current_owner.nil?
      flash[:danger] = "Please log in."
      redirect_to new_owner_session_url
    end
  end

  def correct_owner
    @owner = Owner.find(params[:id])
    redirect_to(root_url) unless current_user?(@owner)
  end

end
