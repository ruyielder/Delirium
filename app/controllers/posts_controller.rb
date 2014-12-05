class PostsController < InheritedResources::Base
  defaults finder: :find_by_slug

  private

    def post_params
      params.require(:post).permit(:title, :slug, :content, :draft, :published_at)
    end
end

