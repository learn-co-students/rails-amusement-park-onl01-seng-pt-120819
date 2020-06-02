Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'static#welcome'

  resources :users, only: [:index, :show, :new, :create]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:update]


  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  #get '/users/new', to: 'users#new'
end
