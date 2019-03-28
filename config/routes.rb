Rails.application.routes.draw do
  get 'signin', to: 'sessions#new'
  delete 'signout', to: 'sessions#delete'
  resources :sessions
end
