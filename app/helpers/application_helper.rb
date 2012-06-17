module ApplicationHelper
  def snippet(quote) 
    wordcount = 30 
    quote.split[0..(wordcount-1)].join(" ") + (quote.split.size > wordcount ? "..." : "") 
  end
end
