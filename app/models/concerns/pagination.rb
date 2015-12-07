module Pagination
  attr_accessor :pagesize, :current_page
  def page page_num
    page_num = page_num.to_i
    page_num = page_num < 0 ? 0 : page_num
    self.current_page = page_num
    if pagesize
      offset(pagesize*current_page).limit(count)
    else
      self
    end
  end
  def per_page count
    self.pagesize = count
    if current_page
      offset(pagesize*current_page).limit(count)
    else
      self
    end
  end
  def fullresultcount
    excluded = [:order, :limit, :offset, :reorder, :includes]
    rel = self.except(*excluded)
    rel.count(:all)
  end
  def pages
    c = fullresultcount/pagesize
    c+=1 if fullresultcount%pagesize > 0
    c
  end
end
