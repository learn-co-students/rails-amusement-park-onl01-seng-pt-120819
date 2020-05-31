Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :rides
  resources :attractions

  get '/signin' => 'sessions#new', as: 'signin'
  post '/signin' => 'sessions#create', as: 'session'
  delete '/logout' => 'sessions#destroy'

  root 'static#home'
end
