# frozen_string_literal: true

class   RegistrationsController < Devise::RegistrationsController

  protected
  # The path used after sign up.
  def after_sign_up_path_for(resource)
    owners_index_path
  end

  def after_sign_in_path_for(resource)
    owners_index_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
