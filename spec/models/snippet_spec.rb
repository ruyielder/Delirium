require 'rails_helper'

RSpec.describe Snippet, :type => :model do
  let(:post) {create(:post)}
  let(:gist_client) {SnippetsHelper::StubGistClient.new('html_url' => 'https://gist.github.com/123')}

  it 'has a valid factory' do
    expect(build(:snippet, post: post)).to be_valid
  end

  it 'is invalid without name' do
    expect(build(:snippet, name: '', post: post)).not_to be_valid
  end

  it 'is invalid without post' do
    expect(build(:snippet, name: '')).not_to be_valid
  end

  it 'is invalid without source' do
    expect(build(:snippet, source: '', post: post)).not_to be_valid
  end

  it 'is valid witout gist_url' do
    expect(build(:snippet, gist_url: '', post: post)).to be_valid
  end

  it 'update gist url before save' do
    snippet = build(:snippet, post: post)
    snippet.gist_client = gist_client
    snippet.save
    expect(snippet.gist_url).to eq('https://gist.github.com/123')
  end
end
