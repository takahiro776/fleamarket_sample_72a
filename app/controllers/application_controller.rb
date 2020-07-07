class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception 一旦コメントアウトしてます
  # before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day,])
  end

  def production?
    Rails.env.production?
  end

  
end
