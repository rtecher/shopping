Rails.application.routes.draw do
  devise_for :users
  resources :products do
    resources :comments
  end
  root 'products#index'
end
