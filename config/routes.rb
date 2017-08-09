Rails.application.routes.draw do
  get 'errors/forbidden'

  namespace :admin, path: 'fiddle' do
    resources :categories
    resources :products, param: :slug
    resources :producers
    resources :images, only: :destroy
    root 'dashboard#index'
  end

  root 'welcome#home'
  get 'contacts', to: 'welcome#contacts'

  resources :categories, only: :show, param: :slug
  resources :products, only: :show, param: :slug
  resources :producers, only: :show, param: :slug
  get '/price-list', to: 'price_lists#show', as: :price_list

  devise_for :users
end
