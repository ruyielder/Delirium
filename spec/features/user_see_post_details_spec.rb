require 'rails_helper'


feature 'User sees posts' do
  scenario 'he sees single post' do
    post = create(:published_post)

    visit post_path(slug: post.slug)

    expect(page).to have_text(post.title)
  end
end
