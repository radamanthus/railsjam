class HomeController < ApplicationController
  respond_to :html, :rss

  def index
    respond_with(@posts = Post.published.order("created_at DESC"))
  end
  
  def show
    
  end
  
  def page_not_found
    
  end

end
