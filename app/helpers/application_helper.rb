module ApplicationHelper
  def parse_tags(tags)
    tags.map(&:name).map(&:capitalize).join(', ')
  end
end
