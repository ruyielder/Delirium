class PostsDecorator < PaginatingDecorator

  def group_by_archives_published_at
    object.group_by {|post| post.decorate.archives_published_at}
  end

end