Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users
  resources :users, except: [:destroy, :create]
  resources :pairs, only: [:index, :show, :create]

end
