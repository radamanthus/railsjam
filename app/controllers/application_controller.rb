class ApplicationController < ActionController::Base
  
  
  protect_from_forgery
  layout 'application'
  
  helper_method :current_user  
  before_filter :common
  before_filter :authenticate

  
  private
  
  def current_path
    @current_path = request.request_uri
    @links = @current_path.split('/')
    @first_path = @links[1]
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def require_admin
    unless current_user and current_user.user_type=="Admin"
      flash[:notice] = "You are not an admin. Please login as an admin."
      redirect_to login_url
      return false     
    end
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to login_url
      return false
    end
  end


  def store_location
    session[:return_to] = request.request_uri
  end


  def redirect_back(*params)
    uri = session[:original_uri]
    session[:original_uri] = nil
    if uri
      redirect_to uri
    else
      redirect_to(*params)
    end
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  


  
  def common
    
    @current_host = request.env["HTTP_HOST"] rescue nil
    @current_path = request.env["PATH_INFO"] rescue nil
    @current_browser = request.env["HTTP_USER_AGENT"] rescue nil
    
  end


  def authenticate
    if @current_host.include?('picasso')
     authenticate_or_request_with_http_basic do |username, password|
       md5_of_password = Digest::MD5.hexdigest(password)
       username == 'admin' && md5_of_password == 'a5fe3682798613881d7e99ef3ec6b64d'
     end
   end
  end
  
end
