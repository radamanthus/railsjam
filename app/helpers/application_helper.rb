module ApplicationHelper
  

  
  FLASH_TYPES = [:error, :warning, :success, :message, :notice, :account_error]

  def display_flash(type = nil)
    html = ""
    
    if type.nil?
      FLASH_TYPES.each { |name| html << display_flash(name) }
    else
      return flash[type].blank? ? "" : "<div class=\"#{type}\"><p>#{flash[type]}</p></div>" 
    end
    
    html
  end
 

  def get_host(url)
    
    begin
      uri = URI.parse(url)
      return uri.host
    rescue URI::InvalidURIError
      return url.gsub(/^(http:\/\/|https:\/\/)/, "")
    end


  end 
  
  #validation 
  def valid_email(email)
    regex = Regexp.new(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)
    if email and email.match(regex)
      return true
      
    else
      return false
    end    
  end
 
 
  def get_avatar_by_username(username ,size = "b")


    #m n b o
    url = "http://img.tweetimag.es/i/#{username}_#{size}"
    #http://www.techcrunch.com/2009/09/28/tweetimag-es-an-end-to-broken-twitter-avatars/
    return  url
  end
  
  def get_twitter_link(username,status_id)
    return "http://twitter.com/#{username}/status/#{status_id}"
  end
 
  
end
