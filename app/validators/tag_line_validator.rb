class TagLineValidator < ActiveModel::EachValidator
  def initialize(options)
    super(options)
    @tag_parser = TagsHelper::TagParser.new
  end

  def validate_each(record, attribute, value)
    tags = @tag_parser.parse(value)
    unless tags.uniq == tags
      record.errors.add(attribute, 'Tagi nie mogą się powtarzać.')
    end
  end
end