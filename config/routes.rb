Rails.application.routes.draw do
  root "users#index"
  resources :users, only: [:new, :create, :show] 
  resources :attractions
  get '/' => 'users#index'
  get '/signin' => 'session#new'
  post '/signin' => 'session#create'
  get '/logout' => 'session#destroy'
  post '/rides' => 'rides#create'
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
