module ApplicationHelper
  def will_paginate collection
    html = "<div class='text-center'><ul class='pagination'>"
    collection.pages.times do |i|
      if i == (collection.current_page || 0)
        html+="<li class='active'>#{link_to i,page:i}</li>"
      else
        html+="<li>#{link_to i,page:i}</li>"
      end
    end
    html+="</ul></div>"
    html.html_safe
  end
end
