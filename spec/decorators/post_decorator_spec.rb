require 'spec_helper'

describe PostDecorator do

  it 'has a link to self' do
    post = create(:published_post, title: 'hej').decorate
    expect(post.link_to_post).to eq('<a href="/posts/hej">hej</a>')
  end

end
