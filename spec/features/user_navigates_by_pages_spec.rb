require 'rails_helper'


feature 'User navigates by pages' do
  scenario 'User go to 1 page' do
    post = create(:published_post, tag_line: 'python, ruby')

    visit page_path(1)

    expect(page).to have_text(post.title)
  end

  scenario 'User go to 2 page' do
    posts = [
        create(:published_post),
        create(:published_post),
        create(:published_post),
        create(:published_post)
    ]

    visit page_path(2)

    expect(page).not_to have_text(posts[0].title)
    expect(page).not_to have_text(posts[1].title)
    expect(page).to have_text(posts[2].title)
    expect(page).to have_text(posts[3].title)
  end


  scenario 'User go to blank page' do
    visit page_path(2)
    expect(page.status_code).to eq 200
  end

end