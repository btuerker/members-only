Rails.application.routes.draw do
  get 'signin', to: 'sessions#new'
  resources :sessions
end
