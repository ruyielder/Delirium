require 'rails_helper'


feature 'User sees posts' do
  scenario 'he sees many published posts' do
    posts = [create(:published_post), create(:published_post)]

    visit posts_path

    expect(page).to have_text(posts[0].title)
    expect(page).to have_text(posts[1].title)
  end

  scenario "he don't see draft posts" do
    post = create(:draft_post)

    visit posts_path

    expect(page).not_to have_text(post.title)
  end

  scenario 'he sees humanized comment count' do
    post = create(:published_post)
    create(:comment_post, post: post)

    visit posts_path

    expect(page).to have_text('1 komentarz')
  end

  scenario 'he sees image when content is valid' do
    post = create(:published_post, content: 'Hello, this is my picture IMG:bird')
    image_post = create(:image_post, post: post, basename: 'bird')

    visit posts_path

    expect(page).to have_xpath("//img[@src=\"#{image_post.image_url}\"]")
  end

  scenario "he doesn't sees image when content is invalid" do
    post = create(:published_post, content: 'Hello, this is my picture IMG:BIRD')
    image_post = create(:image_post, post: post, basename: 'bird')

    visit posts_path

    expect(page).not_to have_xpath("//img[@src=\"#{image_post.image_url}\"]")
  end

end