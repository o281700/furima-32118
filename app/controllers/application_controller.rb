class ApplicationController < ActionController::Base
  before_action :configuer_permitted_parameters, if: :devise_controller?

  private
  def configuer_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, key: [
      :nickname, :last_name, :first_name,
      :last_kana, :first_kana, :birthday ])
  end
end
