Readonce::Application.routes.draw do
  devise_for :users
  
  # 2 argument method
  #resource -method
  #:mockup - first argument
  #controller: 'mockup', only: [:index, :show] - second argument is a hash 
  
  resource :mockup, controller: 'mockup', only: [:index, :show]
  
  root to: 'mockup#index'
  
  #resources = a group of routes
  # :messages is a symbol
  
  resources :messages
  
end
