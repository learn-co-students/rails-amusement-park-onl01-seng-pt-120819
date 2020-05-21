Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :attractions
  resources :rides
  # resources :sessions

  root 'static#home'

  get '/signin', to: "session#new", as: 'signin'
  post '/signin', to: "session#create", as: 'session'
  delete '/logout', to: "session#destroy"
end
