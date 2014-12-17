require 'redcarpet'

module PostsHelper

  class HTMLwithGists < Redcarpet::Render::HTML
    def block_code(code, language)
      snippet = Snippet.where(name: code.strip).first
      create_script_markup(snippet.gist_url)
    end

    def create_script_markup(url)
      "<script src='#{url}.js'></script>"
    end
  end

end
