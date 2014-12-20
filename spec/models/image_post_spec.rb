require 'rails_helper'

RSpec.describe ImagePost, :type => :model do
  let(:post) {create(:published_post)}

  it 'has a valid factory' do
    expect(build(:image_post, post: post)).to be_valid
  end

  it 'is invalid when basename contains white characters' do
    expect(build(:image_post, post: post, basename: 'first  second')).not_to be_valid
  end

  it 'is invalid when basename contains special characters' do
    expect(build(:image_post, post: post, basename: 'file.txt')).not_to be_valid
  end

  it 'is valid when basename contains polish characters' do
    expect(build(:image_post, post: post, basename: 'żółęść')).to be_valid
  end

  it 'is valid when basename is emtpy' do
    expect(build(:image_post, post: post, basename: '')).not_to be_valid
  end

  it 'is invalid when image is empty' do
    expect(build(:image_post, post: post, image: '')).not_to be_valid
  end
end
