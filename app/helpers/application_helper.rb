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
  
  
  #validation 
  def valid_email(email)
    regex = Regexp.new(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i)
    if email and email.match(regex)
      return true
      
    else
      return false
    end    
  end
  
  
end
