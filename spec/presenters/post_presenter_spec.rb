require 'rails_helper'

describe PostPresenter do

  it 'is able to render markdown' do
    post = create(:post, content: 'Hello, I **like** you!')
    presenter = PostPresenter.new(post)
    expect(presenter.content).to eq('<p>Hello, I <strong>like</strong> you!</p>\n')
  end

end