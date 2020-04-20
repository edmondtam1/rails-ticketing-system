module ApplicationHelper
  include ActionView::Helpers::DateHelper

  def parse_tags(tags)
    tags.map(&:name).map(&:capitalize).join(', ')
  end

  def get_comment_form_url(comment, ticket)
    if comment.new_record?
      ticket_comments_path(ticket)
    else
      ticket_comment_path(ticket, comment)
    end
  end
end
