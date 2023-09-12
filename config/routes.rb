Rails.application.routes.draw do
  devise_for :users
  resources :groups, path: 'categories', only: [:new, :index, :create] do
    resources :records, only: [:new, :index, :create]
  end
  root 'home#index'
end