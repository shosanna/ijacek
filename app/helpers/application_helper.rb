module ApplicationHelper

  def link_to_icon(icon, url, options = {})
    link_to url, options do
      content_tag :i, "", class: icon
    end
  end

  def text_to_link(text)

  end
end

