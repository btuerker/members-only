class PostsController < ApplicationController
  include ApplicationHelper

  before_action :signed_in, only: [:new, :create]

  def index
    @posts = Post.all
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:succes] = "Post succesfully created!"
      redirect_to @post
    else
      flash.now[:danger] = "There was some problems occured"
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def signed_in
    unless signed_in?
      flash[:danger] = "Please signin to reach posts#new"
      redirect_to signin_path
    end
  end
end
