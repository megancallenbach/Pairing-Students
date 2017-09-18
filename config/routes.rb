Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users
  resources :users
  # do
  #   resources :admins
  #   resources :students
  # end
  resources :pairs
  resources :profiles, only: [:new, :edit, :create, :update]
end
