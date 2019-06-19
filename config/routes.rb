Rails.application.routes.draw do
  get 'events/new'
  get 'events/show'
  get '/login' , to: "sessions#new"
  post '/login' , to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/signup' , to: "users#new"
  root 'sessions#new'
  resources :users, :only => [ :create, :show]

  resources :events, only: [:new,:create,:show,:index]
end
