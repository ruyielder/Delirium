require 'redcarpet'

class PostDecorator < Draper::Decorator
  delegate_all

  def link_to_post
    h.link_to title, h.post_path(slug)
  end

  def content
    renderer = Redcarpet::Render::HTML.new
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(object.content).html_safe
  end

end
