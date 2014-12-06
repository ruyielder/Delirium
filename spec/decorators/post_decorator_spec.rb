require 'spec_helper'

describe PostDecorator do
  it 'has a link to self' do
    post = create(:published_post, title: 'hej').decorate
    expect(post.link_to_post).to eq('<a href="/posts/hej">hej</a>')
  end

  it 'has content as markdown' do
    post = create(:post, content: 'Hello, I **like** you!').decorate
    expect(post.content).to eq("<p>Hello, I <strong>like</strong> you!</p>\n")
  end
end
