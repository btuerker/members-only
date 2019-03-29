Rails.application.routes.draw do
  root 'posts#index'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#delete'
  resources :sessions
  resources :posts, only: [:new, :create, :index]
end
