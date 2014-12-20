require 'rails_helper'

RSpec.describe ImagePost, :type => :model do
  it 'has a valid factory' do
    post = create(:published_post)
    expect(build(:image_post, post: post)).to be_valid
  end
end
