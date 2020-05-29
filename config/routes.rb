Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users
resources :sessions
resources :attractions
resources :rides

root to: 'application#index'

get '/signin' => 'sessions#new' 
get '/logout' => 'sessions#destroy'
end
