Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#delete'
  resources :sessions
  resources :posts, only: [:new, :create, :index]
end
