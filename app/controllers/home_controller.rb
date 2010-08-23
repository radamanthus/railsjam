class HomeController < ApplicationController
  respond_to :html, :rss

  def index
    @posts = Post.published.order("created_at DESC").paginate( :page => params[:page], :per_page => 3)
    respond_with(@posts)
  end
  
  def show

  end
  
  def page_not_found
    
  end

end
