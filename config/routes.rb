Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :attractions

  root 'static#home'

  get '/signin', to: "users#signin"
  post '/signin', to: "users#show"
end
