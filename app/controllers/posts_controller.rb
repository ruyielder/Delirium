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
    @post = find_post_by_slug(params[:slug])
    @comment_post = create_comment_post_with_post(@post)
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

  def create_comment_post_with_post(post)
    # if current_admin_user
    #   create_comment_post_by_admin_user(post)
    # else
      create_comment_post_by_guest(post)
    # end
  end

  def create_comment_post_by_admin_user(post)
    CommentPost.create(
      params.require(:comment_post).
      permit(:name, :url, :email, :content).
      merge(post: post)
    )
    # TODO: dodaj admin usera do comments
  end

  def create_comment_post_by_guest(post)
    CommentPost.create(
      params.require(:comment_post).
      permit(:name, :url, :email, :content).
      merge(post: post)
    )
  end
end

