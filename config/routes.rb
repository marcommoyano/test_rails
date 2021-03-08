Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :characters
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get 'welcome', to: 'sessions#welcome'
  root 'sessions#new'
  get 'authorized', to: 'sessions#page_requires_login'
end
