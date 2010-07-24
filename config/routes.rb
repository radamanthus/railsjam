Railsjam::Application.routes.draw do |map|
  
  
  resources :pages
  resource :user_session
  
  get "home/index"
  match 'logout', :to => 'user_sessions#destroy', :as => "logout"
  match 'login', :to => 'user_sessions#new', :as => "login"

  root :to => "home#index"

end
