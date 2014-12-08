require 'spec_helper'

describe TagsHelper do
  let(:parser) { TagsHelper::TagParser.new }

  it 'parses nil' do
    expect(parser.parse(nil)).to eq([])
  end

  it 'parses empty line' do
    expect(parser.parse('')).to eq([])
  end

  it 'parses line with whitespaces' do
    expect(parser.parse('             ')).to eq([])
  end

  it 'parses line with separators' do
    expect(parser.parse(',,   , ,')).to eq([])
  end

  it 'parses line with tag' do
    expect(parser.parse('ruby')).to eq(['ruby'])
  end

  it 'parses line with tag and whitespaces' do
    expect(parser.parse('   ruby    ')).to eq(['ruby'])
  end

  it 'parses line with many tags' do
    expect(parser.parse('ruby, python, java')).to eq(%w[ruby python java])
  end

  it 'parses line with many tags where separator is on start' do
    expect(parser.parse(',ruby, python, java')).to eq(%w[ruby python java])
  end

  it 'parses line with many tags where separator is on end' do
    expect(parser.parse('ruby, python, java,')).to eq(%w[ruby python java])
  end

  it 'parses line with many tags with duplicates' do
    expect(parser.parse('ruby, python, java,python, python')).to eq(%w[ruby python java python python])
  end
end
