Rails.application.routes.draw do
  resources :users
  resources :microposts, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]

  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  get '/help', to: 'static_pages#help'  
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  root to: 'static_pages#home'
end
