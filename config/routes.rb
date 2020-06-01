Rails.application.routes.draw do
  
  get 'rides/show'
  get 'rides/create'
  root 'welcome#home'
  
  #get 'attractions/index'
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  
  get 'logout' => 'sessions#destroy'
  
  post '/take_ride' => 'users#ride'
  # get 'signup', to: 'users#new'
  # post 'signup', to: 'users#create'
  
  resources :attractions
  resources :users
  resources :rides, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
