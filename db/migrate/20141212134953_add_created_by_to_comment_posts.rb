class AddCreatedByToCommentPosts < ActiveRecord::Migration
  def change
    add_reference :comment_posts, :admin_user, index: true
  end
end
