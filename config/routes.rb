Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :articles

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :products, only: :show
  resources :categories, only: :show
  get 'pages/market' => 'pages#market'
  resources :pages, path: '', only: :show
  resources :contacts

  # Example of regular route:
  get 'products/:id/:option' => 'products#detail', as: :product_detail

  constraints(SubdomainRoutes) do
    # resources :blogs, only: [:new]
    root 'pages#index_all'
  end
  
  constraints(!SubdomainRoutes) do
    root 'pages#index'
  end
end
