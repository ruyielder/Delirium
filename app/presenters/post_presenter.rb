require 'redcarpet'

class PostPresenter

  def initialize(post)
    @post = post
  end

  def title
    @post.title
  end

  def published_at
    @post.published_at
  end

  def content
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(@post.content).html_safe
  end
end