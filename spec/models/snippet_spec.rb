require 'rails_helper'

RSpec.describe Snippet, :type => :model do
  it 'has a valid factory' do
    post = create(:post)
    expect(create(:snippet, post: post).valid?).to be true
  end
end
