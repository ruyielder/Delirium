require 'rails_helper'


feature 'User navigates by category pages' do
  let(:db_category) {create(:category, name: 'db')}
  let(:ror_category) {create(:category, name: 'ror')}

  scenario 'User go to 1 page' do
    post = create(:published_post, category: db_category)

    visit category_posts_page_path(db_category.slug, 1)

    expect(page).to have_text(post.title)
  end

  scenario 'User go to 2 page' do
    posts = [
      create(:published_post, category: db_category),
      create(:published_post, category: db_category),
      create(:published_post, category: db_category),
      create(:published_post, category: ror_category)
    ]

    visit category_posts_page_path(db_category.slug, 2)

    expect(page).not_to have_text(posts[0].title)
    expect(page).not_to have_text(posts[1].title)
    expect(page).to have_text(posts[2].title)
    expect(page).not_to have_text(posts[3].title)
  end

  scenario 'User go to blank page' do
    visit category_posts_page_path('javascript', 3)
    expect(page.status_code).to eq 404  # because tag javascript doesn't exists
  end
end