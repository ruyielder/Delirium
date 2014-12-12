require 'http'

module SnippetsHelper

  class GistHttpClient

    def initialize(api_url='https://api.github.com/gists', http_provider=HTTP)
      @api_url = api_url
      @http_provider = http_provider
    end

    def post_file(filename, content)
      gist_data = make_gist_data(filename, content)
      response = @http_provider.post(@api_url, json: gist_data)
      response.parse
    end

    private

    def make_gist_data(filename, content)
      {
          public: true,
          files: {filename => {content: content}}
      }
    end
  end

end