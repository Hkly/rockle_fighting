class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil unless session[:session_token]
    User.find_by_session_token(session[:session_token])
  end

  def ensure_signed_in
    redirect_to new_session_url unless signed_in?
  end

  def ensure_signed_out
    redirect_to root_url if signed_in?
  end

  def signed_in?
    !!current_user
  end

  def signin_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def signout_user!
    session[:session_token] = nil
  end
end
