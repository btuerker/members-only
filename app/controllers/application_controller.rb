class ApplicationController < ActionController::Base

  def logged_in
    if (user = User.find(session[:user_id]))
      return user
    elsif (user = User.find_by(remember_token: cookies[:remember_token]))
      return user
    else
      return false
    end
  end

  def current_user

  end

  def current_user=(user)
  end
end
