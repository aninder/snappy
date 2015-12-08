module Pagination
  attr_accessor :pagesize, :current_page
  def page page_num
    page_num = page_num.to_i
    page_num = page_num < 0 ? 0 : page_num
    scope = self.extending do
      define_method :per_page do |count|
        self.pagesize = count
        self.current_page = page_num
        offset(count*page_num).limit(count)
      end
    end
    scope
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
