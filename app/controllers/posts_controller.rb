class PostsController < ApplicationController
  respond_to :html

  def index
    if admin_user_signed_in?
      @value = 42
      @user = current_admin_user
    end
    @posts = Post.published.
      ordered.
      page(params[:page]).
      per(Rails.configuration.posts_per_page).
      decorate
    respond_with(@posts)
  end

  def index_by_category
    @posts = Post.published.
      for_category_slug(params[:category]).
      ordered.
      page(params[:page]).
      per(Rails.configuration.posts_per_page).
        decorate
    @category = Category.friendly.find(params[:category])
    respond_with(@posts)
  end

  def index_by_tag
    @posts = Post.published.
      tagged_with(params[:tag]).
      ordered.
      page(params[:page]).
      per(Rails.configuration.posts_per_page).
      decorate
    @tag = Tag.friendly.find(params[:tag])
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
    @post = find_post_by_slug(params[:slug])
    @comment_post = CommentPost.create(
      params.require(:comment_post).
        permit(:name, :url, :email, :content).
        merge(post: @post, admin_user: current_admin_user)
    )
    if @comment_post.valid?
      redirect_to post_path(@post.slug)
    else
      render :show
    end
  end

  private

  def find_post_by_slug(slug)
    Post.published.friendly.find(slug).decorate
  end
end

