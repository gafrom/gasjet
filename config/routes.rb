Rails.application.routes.draw do
  get 'errors/forbidden'

  namespace :admin, path: 'fiddle' do
    resources :categories
    resources :products
    resources :producers
    root 'dashboard#index'
  end

  root 'welcome#home'
  get 'contacts', to: 'welcome#contacts'

  resources :categories, only: :show, param: :slug
  resources :products, only: :show, param: :slug
  resources :producers, only: :show, param: :slug

  devise_for :users
end
