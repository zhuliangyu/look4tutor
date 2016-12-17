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

  def user_authentication
    redirect_to new_sessions_path unless user_sign_in?
  end

  def is_admin?
    if user_sign_in? && User.find(session[:user_id]).is_admin?
      redirect_to root_path, alert: "Please login first!"
    else

    end

  end
  helper_method :is_admin?


end
