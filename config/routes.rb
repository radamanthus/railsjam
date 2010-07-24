Railsjam::Application.routes.draw do |map|
  
  
  resources :pages
  get "home/index"

  root :to => "home#index"

end
