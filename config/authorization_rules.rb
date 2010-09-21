authorization do
  
  
  role :admin do
    has_permission_on [:events, :home, :pages, :posts, :user_sessions, :users, :attendees], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :page_not_found]
    has_permission_on [:user_sessions], :to => [:index, :new, :create, :log_me_out, :destroy]
  end
  
  role :member do 
     has_permission_on [:events, :attendees], :to => [:index, :show, :new, :create]
     #later - create ability for member to edit owned events only
     
     has_permission_on [:users], :to => [:edit, :update] 
     #fix this - make sure user can edit his own profile ONLY!
     
     has_permission_on [:home, :pages, :posts], :to => [:index, :show, :page_not_found]
     has_permission_on [:user_sessions], :to => [:index, :new, :create, :log_me_out, :destroy]
     
  end
  
  
  role :guest do 
     has_permission_on [:home, :posts, :pages, :events, :attendees], :to => [:index, :show, :page_not_found]
     has_permission_on [:user_sessions], :to => [:new, :create]
     has_permission_on [:users], :to => [:new, :create]
  end


end
