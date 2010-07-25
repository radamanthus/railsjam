class HomeController < ApplicationController
  
  def index
    @promoted = Post.promoted.last
  end
  
  def show
    
  end
  
  def page_not_found
    
  end

end
