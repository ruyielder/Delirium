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
    @comment_post = CommentPost.new
    respond_with(@post, @comment_post)
  end

  def archives
    @posts = Post.published.ordered.decorate
    respond_with(@posts)
  end

  def create_comment_post
    @post = Post.published.friendly.find(params[:slug]).decorate
    comment_post_params = params.require(:comment_post).permit(:name, :url, :email, :content).merge(post: @post)
    @comment_post = CommentPost.create(comment_post_params)
    if @comment_post.valid?
      redirect_to post_path(@post.slug)
    else
      render :show
    end
  end
end

