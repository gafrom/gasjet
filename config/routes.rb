Rails.application.routes.draw do
  get 'errors/forbidden'

  namespace :admin, path: 'fiddle' do
    resources :categories
    resources :sub_categories
    root 'dashboard#index'
  end

  root 'welcome#home'
  get 'contacts', to: 'welcome#contacts'

  resources :categories, only: [:show, :index] do
    resources :sub_categories, only: :show
  end
  resources :products, only: :show, as: 'products'

  devise_for :users
end
