Rails.application.routes.draw do
  devise_for :users do
    resources :admins
    resources :students
  end
  resources :pairs

end
