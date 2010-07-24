Railsjam::Application.routes.draw do |map|
  
  resources :posts
  resources :pages
  resource :user_session
  
  get "home/index"
  match 'logout', :to => 'user_sessions#destroy', :as => "logout"
  match 'login', :to => 'user_sessions#new', :as => "login"
  match 'not_found', :to=>"home#page_not_found", :as=>"not_found"
  match ':id', :to=> 'pages#show', :id=>nil

  root :to => "home#index"

end
