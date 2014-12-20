require 'redcarpet'

class PostDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def link_to_post
    h.link_to title, h.post_path(slug)
  end

  def content
    renderer = PostsHelper::HTMLwithGists.new(
      hard_wrap: true, filter_html: true, autolink: true,
      no_intraemphasis: true, fenced_code: true, gh_blockcode: true)
    markdown = Redcarpet::Markdown.new(renderer,
      :space_after_headers => true, :fenced_code_blocks => true)
    html = markdown.render(object.content)
    image_renderer = PostsHelper::ImagePostRenderer.new(object)
    image_renderer.render(html).html_safe
  end

  def comment_posts
    object.comment_posts.published.decorate
  end

  def published_at
    localize object.published_at
  end
end
