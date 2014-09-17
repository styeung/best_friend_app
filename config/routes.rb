Rails.application.routes.draw do
  root to: "root#root", as: :root
  
  resources :users do
    resources :user_photos, only: [:create, :destroy]
  end
  
  resource :session, only: [:new, :create, :destroy]
  
  resources :meetings
  
  resources :messages
  
end
