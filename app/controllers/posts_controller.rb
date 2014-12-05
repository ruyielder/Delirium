class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    @post = Post.friendly.find(params[:slug])
    respond_with(@post)
  end
end

