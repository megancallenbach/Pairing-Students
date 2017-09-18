Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users
  # do
  #   resources :admins
  #   resources :students
  # end
  resources :pairs
end
