Rails.application.routes.draw do
  get 'pages/about_us'

  get 'pages/communication'

  get 'detailed_products/index'

  resources :sepets, only: [:index]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products do
    resources :comments
    resources :sepets, only: [:create, :destroy]
  end
  root 'products#index'
end
