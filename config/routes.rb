Rails.application.routes.draw do
  get 'errors/forbidden'

  namespace :admin, path: 'fiddle' do
    resources :categories
    resources :products
    root 'dashboard#index'
  end

  root 'welcome#home'
  get 'contacts', to: 'welcome#contacts'

  resources :categories, only: [:show, :index], param: :slug
  resources :products, only: :show, as: 'products', param: :slug

  devise_for :users
end
