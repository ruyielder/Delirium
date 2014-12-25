require 'redcarpet'

module PostsHelper

  class BootstrapHTMLRenderer < Redcarpet::Render::HTML

    def list(contents, list_type)
      markup = list_type_to_s(list_type)
      "<#{markup} class='.list-unstyled'>#{contents}</#{markup}>"
    end

    private

    def list_type_to_s(list_type)
      case list_type
        when :ordered
          'ol'
        when :unordered
          'ul'
        else
          'dl'
      end
    end

  end

  class HTMLwithGists < BootstrapHTMLRenderer
    def block_code(code, language)
      snippet = Snippet.where(name: code.strip).first
      create_script_markup(snippet.gist_url)
    end

    def create_script_markup(url)
      "<script src='#{url}.js'></script>"
    end
  end

  class ImagePostRenderer

    def initialize(post, prefix='IMG:')
      @prefix = prefix
      @regex = Regexp.new(prefix + "\\p{Word}+")
      @image_urls = get_image_urls(post)
    end

    def render(content)
      content.gsub(@regex) do |matched|
        basename = matched[@prefix.size..-1]
        url = @image_urls[basename]
        if url.nil?
          ''
        else
          html_image url
        end
      end
    end

    private

    def get_image_urls(post)
      images = {}
      post.image_posts.each {|image_post| images[image_post.basename] = image_post.image_url}
      images
    end

    def html_image(url)
      "<div class='center-block'><img src='#{url}' class='img-responsive center-block'/></div>"
    end
  end
end
