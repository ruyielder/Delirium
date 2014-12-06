class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.published.decorate
    respond_with(@posts)
  end

  def show
    @post = Post.published.friendly.find(params[:slug]).decorate
    respond_with(@post)
  end
end

