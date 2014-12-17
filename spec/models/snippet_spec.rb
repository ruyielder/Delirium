require 'rails_helper'

RSpec.describe Snippet, :type => :model do
  it 'has a valid factory' do
    post = create(:post)
    expect(build(:snippet, post: post)).to be_valid
  end

  it 'is invalid without name' do
    post = create(:post)
    expect(build(:snippet, name: '', post: post)).not_to be_valid
  end

  it 'is invalid without post' do
    expect(build(:snippet, name: '')).not_to be_valid
  end

  it 'is invalid without source' do
    post = create(:post)
    expect(build(:snippet, source: '', post: post)).not_to be_valid
  end

  it 'is valid witout gist_url' do
    post = create(:post)
    expect(build(:snippet, gist_url: '', post: post)).to be_valid
  end
end
