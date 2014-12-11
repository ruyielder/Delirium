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
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(object.content).html_safe
  end

  def comment_posts
    object.comment_posts.published.decorate
  end
end
