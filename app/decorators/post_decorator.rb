class PostDecorator < Draper::Decorator
  delegate_all

  def link_to_post
    h.link_to title, h.post_path(slug)
  end
end
