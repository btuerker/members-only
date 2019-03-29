class PostsController < ApplicationController
  include ApplicationHelper
  
  before_action :signed_in, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
  end

  def index
  end

  private
    def signed_in
      redirect_to signin_path unless signed_in?
    end
end
