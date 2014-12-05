class PostsController < InheritedResources::Base

  private

    def post_params
      params.require(:post).permit(:title, :slug, :content, :draft, :published_at)
    end
end

