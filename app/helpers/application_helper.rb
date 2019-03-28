module ApplicationHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:remember_token)
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def current_user=(user)
    @current_user = user
  end
end
