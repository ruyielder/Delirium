require 'rails_helper'

RSpec.describe CommentPost, :type => :model do
  let(:post) {create(:published_post)}

  it 'has a valid base factory' do
    expect(build(:comment_post, post: post)).to be_valid
  end

  it 'is invalid without name' do
    expect(build(:comment_post, post: post, name: '')).not_to be_valid
  end

  it 'is invalid with bad formatted email' do
    expect(build(:comment_post, post: post, email: 'booo')).not_to be_valid
  end

  it 'has a valid factory with email' do
    expect(build(:comment_post_with_email, post: post)).to be_valid
  end

  it 'has a valid factory with email but with only spaces' do
    expect(build(:comment_post, post: post, email: '     ')).to be_valid
  end

  it 'is invalid with bad formatted url' do
    expect(build(:comment_post, post: post, url: 'RUBY')).not_to be_valid
  end

  it 'has a valid factory with url' do
    expect(build(:comment_post_with_url, post: post)).to be_valid
  end

  it 'has a published scope' do
    published_comment_post = create(:comment_post, post: post)
    blocked_comment_post = create(:comment_post, post: post, blocked: true)
    expect(CommentPost.published).to eq([published_comment_post])
  end
end
