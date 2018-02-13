Rails.application.routes.draw do
  get 'pages/about_us'

  get 'pages/communication'

  get 'pages/references'

  get 'detailed_products/index'

  resources :sepets, only: [:index]

  match '/google4dee57f5ccc23a18.html',
  to: proc { |env| [200, {}, ["google-site-verification: google4dee57f5ccc23a18.html"]] }, via: :all

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products, only: [:index, :show] do
    resources :comments
    resources :sepets, only: [:create, :destroy]
  end
  root 'products#index'
end
