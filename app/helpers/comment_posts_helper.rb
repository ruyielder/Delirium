module CommentPostsHelper
  def humanize_comment_count(comment_count)
    case comment_count
      when 0
        'Brak komentarzy'
      when 1
        '1 komentarz'
      when 2, 3, 4
        "#{comment_count} komentarze"
      else
        "#{comment_count} komentarzy"
    end
  end
end
