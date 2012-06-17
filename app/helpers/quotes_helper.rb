module QuotesHelper
  def convert_to_slug(author)
    author.gsub(/[^0-9a-z ]/i, '').gsub(/\s/, "_").downcase
  end
  
  def shorten(url)
    Bitly.use_api_version_3
    bitly = Bitly.new("bharani91", "R_6a4731a4c688eef8f7dd4ef8ccaa67d0")
    bitly.shorten(url).short_url
  end
  
  def tweet_msg(quote)
    message = "#{CGI.escape(@quote.quote_text)} - #{@quote.author}" 
    url = "#{shorten('http://quotescube.com/#{@quote.permalink}')}"
    
    if message.length < 130
      return message + " " + url + "&via=quotescube"
    elsif message.length > 120
      return truncate(message, length: 120) + " " + url
    end
  end
end
