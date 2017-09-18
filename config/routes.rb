Rails.application.routes.draw do
  root to: "pairs#index"

  devise_for :users do
    resources :admins
    resources :students
  end
  resources :pairs
end
