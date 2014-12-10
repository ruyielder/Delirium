class CommentPostsDecorator < Draper::CollectionDecorator
  include CommentPostsHelper

  def humanize_count
    humanize_comment_count count
  end
end