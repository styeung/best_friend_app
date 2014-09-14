Rails.application.routes.draw do
  root to: "root#root", as: :root
  
  resources :users
  
  resource :session, only: [:new, :create, :destroy]
  
  resources :meetings
  
  resources :messages
  
end
