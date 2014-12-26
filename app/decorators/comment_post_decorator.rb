class CommentPostDecorator < Draper::Decorator
  delegate_all

  def self.collection_decorator_class
    CommentPostsDecorator
  end

  def humanized_time_difference
    ApplicationHelper::HumanizedTimeDifference.between(object.created_at, Time.now)
  end
end
