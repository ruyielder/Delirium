require 'rails_helper'

describe PostPresenter do
  it 'has a title' do
    post = build(:post)
    presenter = PostPresenter.new(post)
    expect(presenter.title).to eq(post.title)
  end

  it 'has a publish date' do
    post = build(:published_post)
    presenter = PostPresenter.new(post)
    expect(presenter.published_at).to eq(post.published_at)
  end

  it 'is able to render markdown' do
    post = create(:post, content: 'Hello, I **like** you!')
    presenter = PostPresenter.new(post)
    expect(presenter.content).to eq("<p>Hello, I <strong>like</strong> you!</p>\n")
  end
end