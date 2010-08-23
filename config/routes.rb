Railsjam::Application.routes.draw do |map|
 
  resources :events do
    resource :attendees
  end

  resources :users
  match '/signup', :to => 'users#new'

  resources :posts
  resources :pages
  resource :user_session
  
  resources :password_resets
 
  
  get "home/index"
  match 'logout', :to => 'user_sessions#destroy', :as => "logout"
  match 'login', :to => 'user_sessions#new', :as => "login"
  match 'not_found', :to=>"home#page_not_found", :as=>"not_found"
  match 'blog/:id', :to=> 'posts#show'
  match ':id', :to=> 'pages#show', :id=>nil

  resources :home
  root :to => "home#index"

end
