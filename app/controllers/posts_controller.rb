class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.published.
        page(params[:page]).
        per(Rails.configuration.posts_per_page).
        decorate
    respond_with(@posts)
  end

  def index_by_tag
    @posts = Post.published.tagged_with(params[:tag]).decorate
    respond_with(@posts)
  end

  def show
    @post = Post.published.friendly.find(params[:slug]).decorate
    respond_with(@post)
  end
end

