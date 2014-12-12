require 'spec_helper'
require 'webmock/rspec'

describe SnippetsHelper do
  describe 'GistHttpClient' do
    let (:client) {client = SnippetsHelper::GistHttpClient.new}

    before(:each) do
      stub_request(:post, "https://api.github.com/gists").
        with(
          :body => "{\"public\":true,\"files\":{\"hello.rb\":{\"content\":\"puts \\\"hello\\\"\"}}}",
          :headers => {
            'Content-Type' => 'application/json',
            'Host' => 'api.github.com',
            'User-Agent' => 'RubyHTTPGem/0.6.3'
          }).
        to_return(
           :status => 200,
           :body => '{"html_url": "fake url"}',
           :headers => {'Content-Type' => 'application/json'}
        )
    end

    it 'posts file' do
      data = client.post_file('hello.rb', 'puts "hello"')
      expect(data['html_url']).to eq('fake url')
    end
  end
end
