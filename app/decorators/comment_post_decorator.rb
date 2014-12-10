class CommentPostDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    CommentPostsDecorator
  end
end
