class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?


  protected
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
   redirect_to root_url
  end



  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
    helper_method :current_user
 def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :avatar) }
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me, :avatar) }
        devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :full_name, :description, :password, :current_password, :password_confirmation, :avatar) }
  end


end
