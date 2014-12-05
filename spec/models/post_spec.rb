require 'rails_helper'

describe Post do
  it 'has a valid base factory' do
    expect(create(:post).valid?).to be true
  end

  it 'has a valid factory of published posts' do
    expect(create(:published_post).valid?).to be true
  end

  it 'has a valid factory of draft posts' do
    expect(create(:draft_post).valid?).to be true
  end

  it 'is invalid without title' do
    expect {create(:post, title: '')}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'is invalid without content' do
    expect {create(:post, content: '')}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'is invalid without slug' do
    expect {create(:post, slug: '')}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has a valid slug' do
    expect(create(:post, title: 'Żółć jest żółta').slug).to eq 'zolc-jest-zolta'
  end

  it 'has a unique title' do
    create(:post, title: 'Hej')
    expect {create(:post, title: 'Hej')}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'has moved errors from slug to title' do
    create(:post, title: 'Hej')
    post = build(:post, title: 'Hej')
    post.save
    expect(post.valid?).to be false
    expect(post.errors.messages).to eq(title: ['has already been taken'])
  end
end