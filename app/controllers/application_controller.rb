class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  private
  def user_sign_in?
    session[:user_id].present?

  end
  helper_method :user_sign_in?

  def current_user
    if user_sign_in?
      @user=User.find(session[:user_id])
    end
  end
  helper_method :current_user


end
