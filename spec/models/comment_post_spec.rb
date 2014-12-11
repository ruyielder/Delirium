require 'rails_helper'

RSpec.describe CommentPost, :type => :model do
  it 'has a valid base factory' do
    post = create(:published_post)
    expect(build(:comment_post, post: post).valid?).to be true
  end

  it 'is invalid without name' do
    post = create(:published_post)
    expect(build(:comment_post, post: post, name: '').valid?).to be false
  end

  it 'is invalid with bad formatted email' do
    post = create(:published_post)
    expect(build(:comment_post, post: post, email: 'booo').valid?).to be false
  end

  it 'has a valid factory with email' do
    post = create(:published_post)
    expect(build(:comment_post_with_email, post: post).valid?).to be true
  end

  it 'has a valid factory with email but with only spaces' do
    post = create(:published_post)
    expect(build(:comment_post, post: post, email: '     ').valid?).to be true
  end

  it 'is invalid with bad formatted url' do
    post = create(:published_post)
    expect(build(:comment_post, post: post, url: 'RUBY').valid?).to be false
  end

  it 'has a valid factory with url' do
    post = create(:published_post)
    expect(build(:comment_post_with_url, post: post).valid?).to be true
  end

  it 'has a published scope' do
    post = create(:published_post)
    published_comment_post = create(:comment_post, post: post)
    blocked_comment_post = create(:comment_post, post: post, blocked: true)
    expect(CommentPost.published).to eq([published_comment_post])
  end
end
