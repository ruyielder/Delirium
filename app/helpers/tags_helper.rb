module TagsHelper

  class TagParser
    def parse(tag_line)
      return [] if tag_line.nil?
      tokens = tag_line.split(',')
      tokens_without_whitespaces = tokens.map &:strip
      tokens_without_whitespaces.select {|token| token != ''}
    end
  end

end