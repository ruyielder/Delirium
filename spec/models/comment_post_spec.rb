require 'rails_helper'

RSpec.describe CommentPost, :type => :model do
  it 'has a valid base factory' do
    post = create(:published_post)
    expect(build(:comment_post, post: post).valid?).to be true
  end
end
