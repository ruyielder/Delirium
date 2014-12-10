require 'spec_helper'

describe CommentPostsHelper do
  include CommentPostsHelper

  describe '#humanize_comment_count' do
    it 'can humanize 0' do
      expect(humanize_comment_count(0)).to eq('Brak komentarzy')
    end

    it 'can humanize 1' do
      expect(humanize_comment_count(1)).to eq('1 komentarz')
    end

    it 'can humanize 2' do
      expect(humanize_comment_count(2)).to eq('2 komentarze')
    end

    it 'can humanize 3' do
      expect(humanize_comment_count(3)).to eq('3 komentarze')
    end

    it 'can humanize 4' do
      expect(humanize_comment_count(4)).to eq('4 komentarze')
    end

    it 'can humanize 5' do
      expect(humanize_comment_count(5)).to eq('5 komentarzy')
    end

    it 'can humanize 6' do
      expect(humanize_comment_count(6)).to eq('6 komentarzy')
    end
  end
end
