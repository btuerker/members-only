class SessionsController < ApplicationController
  include ApplicationHelper
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      sign_in @user
      flash[:success] = "Successfully logged in"
      redirect_to '/'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def delete
    sign_out
    flash[:succes] = "Succesfuly log out!"
    redirect_to signin_path
  end
end
