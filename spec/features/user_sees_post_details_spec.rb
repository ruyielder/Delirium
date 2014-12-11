require 'rails_helper'


feature 'User sees post details' do
  scenario 'he sees single post' do
    post = create(:published_post)

    visit post_path(slug: post.slug)

    expect(page).to have_text(post.title)
  end

  scenario 'he sees humanized comment count' do
    post = create(:published_post)
    create(:comment_post, post: post)

    visit post_path(slug: post.slug)

    expect(page).to have_text('1 komentarz')
  end

  # scenario 'he sees comments' do
  #   post = create(:published_post)
  #   comment = create(:comment_post, post: post)
  #
  #   visit post_path(post.slug)
  #
  #   expect(page).to have_text(comment.name)
  # end
  #
  # scenario 'he sees published comments' do
  #   post = create(:published_post)
  #   published_comment = create(:comment_post, post: post)
  #   blocked_comment = create(:comment_post, post: post, blocked: true)
  #
  #   visit post_path(post.slug)
  #
  #   expect(page).to have_text(published_comment.name)
  #   expect(page).not_to have_text(blocked_comment.name)
  # end
end
