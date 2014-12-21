require 'rails_helper'

feature 'User sees archives' do
  scenario 'User sees posts titles' do
    posts = [
        create(:published_post),
        create(:published_post),
        create(:published_post),
        create(:published_post)
    ]

    visit archives_path

    expect(page).to have_text(posts[0].title)
    expect(page).to have_text(posts[1].title)
    expect(page).to have_text(posts[2].title)
    expect(page).to have_text(posts[3].title)
  end

  scenario 'User sees published posts titles' do
    posts = [
        create(:published_post),
        create(:draft_post),
        create(:draft_post),
        create(:published_post)
    ]

    visit archives_path

    expect(page).to have_text(posts[0].title)
    expect(page).not_to have_text(posts[1].title)
    expect(page).not_to have_text(posts[2].title)
    expect(page).to have_text(posts[3].title)
  end

  scenario 'he sees meta title' do
    visit archives_path

    expect(page).to have_title('Ruyielder Blog << Archiwum')
  end

end