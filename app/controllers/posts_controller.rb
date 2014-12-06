class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.all.decorate
    respond_with(@posts)
  end

  def show
    @post = Post.friendly.find(params[:slug]).decorate
    respond_with(@post)
  end
end

