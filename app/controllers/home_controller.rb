class HomeController < ApplicationController
  
  def index
    @promoted = Post.promoted.last
    @posts = Post.published.order("created_at DESC")
  end
  
  def show
    
  end
  
  def page_not_found
    
  end

end
