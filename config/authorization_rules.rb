authorization do
  
  
  role :admin do
    has_permission_on [:events, :home, :pages, :posts, :user_sessions, :users, :attendees, :galleries, :photos, :sponsors, :attachments, :presentations], :to => [:index, :show, :new, :create, :edit, :update, :destroy, :page_not_found]
    has_permission_on [:user_sessions, :password_resets], :to => [:index, :new, :create, :log_me_out, :destroy]
  end
  
  role :member do 
     has_permission_on [:events], :to => [:index, :show, :new, :create] 
     
     has_permission_on [:attendees], :to => [:new, :create]

     has_permission_on [:events], :to => [:edit, :update]  do
      if_attribute :user => is { user }
     end
     
     has_permission_on [:users], :to => [:edit, :update]  do
      if_attribute :user => is { user }
     end
     
     has_permission_on [:home, :pages, :posts, :attachments], :to => [:index, :show, :page_not_found]
     has_permission_on [:user_sessions], :to => [:index, :new, :create, :log_me_out, :destroy]
     
     has_permission_on [:galleries, :photos, :sponsors, :presentations], :to=>[:index, :show]
     
  end
  
  
  role :guest do 
     has_permission_on [:home, :posts, :pages, :events], :to => [:index, :show, :page_not_found]
     has_permission_on [:user_sessions, :password_resets], :to => [:new, :create]
     has_permission_on [:users], :to => [:new, :create]
     has_permission_on [:galleries, :photos, :sponsors, :attachments, :presentations], :to=>[:index, :show]
  end


end
