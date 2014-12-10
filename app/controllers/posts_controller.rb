class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.published.
      ordered.
      page(params[:page]).
      per(Rails.configuration.posts_per_page).
      decorate
    respond_with(@posts)
  end

  def index_by_tag
    @posts = Post.published.
      tagged_with(params[:tag]).
      ordered.
      page(params[:page]).
      per(Rails.configuration.posts_per_page).
      decorate
    @tag_slug = params[:tag]
    respond_with(@posts)
  end

  def show
    @post = Post.published.friendly.find(params[:slug]).decorate
    respond_with(@post)
  end

  def archives
    @posts = Post.published.ordered.decorate
    respond_with(@posts)
  end
end

