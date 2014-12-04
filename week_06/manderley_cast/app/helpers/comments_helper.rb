module CommentsHelper

  def author_display_name comment
    str = comment.user.username
    unless comment.user.plain?
      str += " (#{comment.user.role})"
    end
    str
  end
end
