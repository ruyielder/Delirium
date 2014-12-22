require 'rails_helper'


feature 'User sees category posts' do
  let(:db_category) {create(:category, name: 'db')}
  let(:ror_category) {create(:category, name: 'ror')}

  scenario 'he sees category posts when all posts have right category' do
    posts = [create(:published_post, category: db_category), create(:published_post, category: db_category)]

    visit category_posts_path(db_category.slug)

    expect(page).to have_text(posts[0].title)
    expect(page).to have_text(posts[1].title)
  end

  scenario 'he sees posts when one post has right category' do
    posts = [create(:published_post, category: db_category), create(:published_post, category: ror_category)]

    visit category_posts_path(ror_category.slug)

    expect(page).not_to have_text(posts[0].title)
    expect(page).to have_text(posts[1].title)
  end

  scenario 'he sees 404, when used wrong category' do
    visit category_posts_path('python')

    expect(page.status_code).to eq(404)
  end

  scenario 'he sees humanized comment count' do
    post = create(:published_post, category: db_category)
    create(:comment_post, post: post)

    visit category_posts_path(db_category.slug)

    expect(page).to have_text('1 komentarz')
  end

  scenario 'he sees meta title' do
    create(:published_post, category: db_category)

    visit category_posts_path(db_category.slug)

    expect(page).to have_title('Ruyielder Blog << db')
  end
end