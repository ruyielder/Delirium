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

  it 'has published scope' do
    posts = [create(:published_post), create(:published_post), create(:draft_post)]
    published_posts = Post.published
    expect(published_posts.length).to eq(2)
    expect(posts[0]).to eq(published_posts[0])
    expect(posts[1]).to eq(published_posts[1])
  end

  it 'is valid with tags' do
    expect(build(:post, tag_line: 'python, ruby').valid?).to be true
  end

  it 'is invalid with duplicated tags in tag_line' do
    expect {create(:post, tag_line: 'python, python')}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'creates tags after save' do
    post = create(:post, tag_line: 'python, ruby')
    tag_names = post.tags.map &:name
    expect(tag_names).to eq(%w[python ruby])
  end

  it 'can update tags' do
    post = create(:post, tag_line: 'python, ruby')
    post.update_attribute(:tag_line, 'python, javascript, ruby')
    tag_names = Set.new post.tags.map &:name
    expect(tag_names).to eq(Set['python', 'javascript', 'ruby'])
  end

  it 'has tagged_with scope' do
    posts = [create(:post, tag_line: 'python'), create(:post, tag_line:'python, ror')]
    expect(Post.tagged_with('ror').all).to eq([posts[1]])
  end

  it 'update publish datetime if post is not a draft' do
    post = create(:post, draft: false)
    expect(post.published_at).not_to be_nil
  end

  it 'has got only one publish datetime' do
    post = create(:post, draft: false)
    published_at = post.published_at
    post.save
    expect(post.published_at).to eq published_at
  end
end