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
end
