require 'rails_helper'


feature 'User sees tagged posts' do
  scenario 'he sees tagged posts when all posts have right tag' do
    posts = [create(:published_post, tag_line: 'python, ruby'), create(:published_post, tag_line: 'ruby, ror')]

    visit tagged_posts_path('ruby')

    expect(page).to have_text(posts[0].title)
    expect(page).to have_text(posts[1].title)
  end

  scenario 'he sees tagged posts when one post has right tag' do
    posts = [create(:published_post, tag_line: 'python, ruby'), create(:published_post, tag_line: 'ruby, ror')]

    visit tagged_posts_path('ror')

    expect(page).not_to have_text(posts[0].title)
    expect(page).to have_text(posts[1].title)
  end

  scenario 'he sees 404, when used wrong tag' do
    visit tagged_posts_path('ror')

    expect(page.status_code).to eq(404)
  end

  scenario 'he sees humanized comment count' do
    post = create(:published_post, tag_line: 'ruby')
    create(:comment_post, post: post)

    visit tagged_posts_path('ruby')

    expect(page).to have_text('1 komentarz')
  end
end