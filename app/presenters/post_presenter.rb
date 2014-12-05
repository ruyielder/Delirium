require 'redcarpet'

class PostPresenter

  def initialize(post)
    @post = post
  end

  def content
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(@post.content).html_safe
  end

end