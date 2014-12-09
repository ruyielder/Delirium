require 'rails_helper'


feature 'User navigates by tag pages' do
  scenario 'User go to 1 page' do
    post = create(:published_post, tag_line: 'python, ruby')

    visit tagged_posts_page_path('python', 1)

    expect(page).to have_text(post.title)
  end

  scenario 'User go to 2 page' do
    posts = [
      create(:published_post, tag_line: 'python, ror'),
      create(:published_post, tag_line: 'python, ror'),
      create(:published_post, tag_line: 'python, ror'),
      create(:published_post, tag_line: 'python, javascript')
    ]

    visit tagged_posts_page_path('ror', 2)

    expect(page).not_to have_text(posts[0].title)
    expect(page).not_to have_text(posts[1].title)
    expect(page).to have_text(posts[2].title)
    expect(page).not_to have_text(posts[3].title)
  end

  scenario 'User go to blank page' do
    visit tagged_posts_page_path('javascript', 3)
    expect(page.status_code).to eq 404  # because tag javascript doesn't exists
  end
end