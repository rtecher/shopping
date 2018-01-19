Rails.application.routes.draw do
  get 'detailed_products/index'

  get 'sepets/index'

  get 'sepets/create'

  get 'sepets/destroy'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products do
    resources :comments
    resources :sepets, only: [:create, :destroy]
  end
  root 'products#index'
end
